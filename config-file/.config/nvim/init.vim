"{{{ Vundle's
"Fixing vundle
"   git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"Vim Websites
"       http://vim.wikia.com/wiki/Special:Random
" Setting up different .vimrc file
" - vim --cmd 'set rtp^=alternate_dir'
set rtp+=~/.config/nvim/Vundle.vim
call vundle#begin()
Plugin 'majutsushi/tagbar'
		"nmap <F8> :TagbarToggle<CR>
		nmap t :TagbarToggle<CR>
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'easymotion/vim-easymotion'
		" binding easymotion with 's'
		nmap f <Plug>(easymotion-s)
		" using both uppercase and lowercase
		let g:EasyMotion_smartcase = 1
"Plugin 'garbas/vim-snipmate'
"Plugin 'honza/vim-snippets'
"Plugin 'kien/ctrlp.vim'
"Plugin 'tomtom/tlib_vim'
call vundle#end()
"}}}
"{{{ Basic Set's
colorscheme pablo
filetype plugin indent on
set clipboard=unnamed
set encoding=utf-8
set foldmethod=syntax
set foldmethod=marker
set hlsearch
set ignorecase
set relativenumber
set showcmd
set smartcase
set tabstop=4
set undolevels=1000
setlocal foldclose=all
syntax on
"}}}

let mapleader=","
"{{{ Function
"{{{ Function: Toggle of rnu and no
nnoremap <leader>l :call NumberToggle()<CR>
function! NumberToggle()
    if(&rnu == 0)
        set rnu
		echo 'rnu on'
    else
        set nornu
		echo 'rnu off'
    endif
endfunction
"}}}
"{{{ Function: Toggle mouse mode
nnoremap <leader>m :call MouseToggle()<CR>
function! MouseToggle()
	if(&mouse == 'a')
		set mouse=
		echo 'mouse off'
	else
		set mouse=a 
		echo 'mouse on'
	endif
endfunction
"}}}
"}}}
"{{{ Mapping Keys
"{{{ Disabling Key
"noremap <Up> <NOP>
"noremap <Down> <NOP>
"noremap <Left> <NOP>
"noremap <Right> <NOP>
nnoremap <C-m> <NOP>
"nnoremap <C-m> <ESC>i<C-m><ESC>
"nnoremap <BS> <ESC>i<BS><ESC>
nnoremap <BS> <NOP>
"}}}
"{{{ Normal Mode
nnoremap ; :
nnoremap <F6> :exec '!'.getline('.')<CR>
"}}}
"{{{ Ex Mode
command Q q!
command Wq wq!
"}}}
"{{{ Leader Mode
nnoremap <leader>t gt
nnoremap <leader>qq :q!
nnoremap <leader>wq :wq
"}}}
nnoremap <space><space> <Esc>/<++><Enter>"_c4l
"}}}
"{{{ Autocmd
autocmd BufNewFile,BufRead *.md setlocal spell
"}}}
"{{{ Local Leader 
let maplocalleader=" "
autocmd BufNewFile,BufRead * nnoremap <buffer> <localleader>[[ I#{{{  
autocmd BufNewFile,BufRead * nnoremap <buffer> <localleader>]] I#}}}<esc>
"{{{ Bash autocmd
autocmd FileType bash	    nnoremap <buffer> <localleader>c maggO#!/bin/bash<C-m><esc>'a
"}}}
"{{{ Python autocmd
autocmd FileType python     nnoremap <buffer> <localleader>3 I#!/usr/bin/env python3<C-m><esc>
" try and except:
autocmd FileType python     nnoremap <buffer> <localleader>t msVip<esc>mt<esc>oexcept:<esc>k<c-v>'sI    <esc>O<esc>itry:<esc>/except:<C-m>
autocmd FileType python     nnoremap <buffer> <localleader>2 I#!/usr/bin/env python2<C-m><esc>
autocmd FileType python     nnoremap <buffer> <localleader>' I'''<C-m><++><C-m>'''<esc>2k0<esc>
autocmd FileType python     nnoremap <buffer> <localleader>f Ifor <++> in range(<++>,<++>):<C-m><++><esc>k0
autocmd FileType python     nnoremap <buffer> <localleader>fi Ifor <++> in <++>.split('\n'):<C-m>if '<++>' in <++>:<C-m>print(<++>)<esc>2k0
autocmd FileType python     nnoremap <buffer> <localleader>im Iimport   
autocmd FileType python     nnoremap <buffer> <localleader>imbs <esc>mbggofrom bs4 import BeautifulSoup<C-m><ESC>'bibs = BeautifulSoup(<++>,'lxml')<ESC>0
autocmd FileType python     nnoremap <buffer> <localleader>imj <esc>mjggoimport json<C-m><ESC>'jij = json.loads(<++>)<ESC>0
autocmd FileType python     nnoremap <buffer> <localleader>imo <esc>moggoimport os<esc>'o
autocmd FileType python     nnoremap <buffer> <localleader>imr <esc>mrggoimport requests<C-m><esc>'rir = requests.get('<++>').text<esc>0
"autocmd FileType python     nnoremap <buffer> <localleader>imr iimport requests<C-m>r = requests.get('<++>').text<esc>0
autocmd FileType python     nnoremap <buffer> <localleader>ims Iimport sys<C-m><esc>
autocmd FileType python     nnoremap <buffer> <localleader>imt <esc>mtggoimport time<esc>'titime.sleep(<++>)<esc>0
autocmd FileType python     nnoremap <buffer> <localleader>o I <++> = open('<++>','<++>')<esc>0
autocmd FileType python     vnoremap <buffer> <localleader>so :sort<C-m>
"}}}
"{{{ HTML / Pandoc
 
"}}}
"}}}
"{{{ gpg config.
" Transparent editing of gpg encrypted files.
" pgp extention is used instead of .gpg, just to differencement.
augroup encrypted
  au!
  autocmd BufReadPre,FileReadPre *.pgp set viminfo=
  " We don't want a swap file, as it writes unencrypted data to disk
  autocmd BufReadPre,FileReadPre *.pgp set noswapfile
  " Switch to binary mode to read the encrypted file
  autocmd BufReadPre,FileReadPre *.pgp set bin
  autocmd BufReadPre,FileReadPre *.pgp let ch_save = &ch|set ch=2
  " (If you use tcsh, you may need to alter this line.)
  autocmd BufReadPost,FileReadPost *.pgp '[,']!gpg --decrypt 2> /dev/null
  " Switch to normal mode for editing
  autocmd BufReadPost,FileReadPost *.pgp set nobin
  autocmd BufReadPost,FileReadPost *.pgp let &ch = ch_save|unlet ch_save
  autocmd BufReadPost,FileReadPost *.pgp execute ":doautocmd BufReadPost " . expand("%:r")
  autocmd BufWritePre,FileWritePre *.pgp '[,']!gpg -ac 2>/dev/null
  autocmd BufWritePost,FileWritePost *.pgp u
augroup END
"}}}
"{{{ Testing
"{{{ Installing Vundle
command VundleGitInstall :! git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/Vundle.vim
"}}}
"{{{ Testing map
map <F5> :!%:p
"}}}
inoremap jk <esc>
inoremap kj <esc>
inoremap 99 (
inoremap 00 )
"}}}
set clipboard=unnamedplus
let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'kinds' : [
        \ 'h:Heading_L1',
        \ 'i:Heading_L2',
        \ 'k:Heading_L3'
    \ ]
\ }

"{{{ Split Navigation
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>
"}}}
