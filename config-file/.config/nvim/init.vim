" Some website:
" 	- http://vimcolors.com
"{{{ Vundle's
"Fixing vundle
"   git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"{{{ Installing Vundle
command VundleGitInstall :! git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/Vundle.vim
"}}}
"Vim Websites
"       http://vim.wikia.com/wiki/Special:Random
" Setting up different .vimrc file
" - vim --cmd 'set rtp^=alternate_dir'
set rtp+=~/.config/nvim/Vundle.vim
call vundle#begin()
"Plugin 'andmarti1424/sc-im'
Plugin 'vim-syntastic/syntastic'
"{{{ .......................... Syntax Checking 'vim-syntastic/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:pymode_rope = 0
"}}}
Plugin 'majutsushi/tagbar'
"{{{ ..................... Function plugin 'majutsushi/tagbar'
let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'kinds' : [
        \ 'h:Heading_L1',
        \ 'i:Heading_L2',
        \ 'k:Heading_L3'
    \ ]
\ }
"}}}
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
"{{{ Basic Set
" {{{ Color 
"colorscheme pablo
colorscheme northpole
" tmux color fix
set termguicolors
" }}}
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
set undolevels=100
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
"{{{ Folder Toggle
let b:foldertoggle = "on"
nnoremap F :call FolderToggle()<CR>
function! FolderToggle()
    if b:foldertoggle == 'on'
        set nofoldenable
		echo 'Folder Toggle Off'
		let b:foldertoggle = "off"
    else
        set foldenable
		echo 'Folder Toggle On'
		let b:foldertoggle = "on"
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
nnoremap <leader>qq <ESC>:q!
nnoremap <leader>wq :wq
"}}}
nnoremap <space><space> <ESC>/<++><Enter>"_c4l
"}}}
"{{{ Autocmd
autocmd BufNewFile,BufRead *.md setlocal spelllang=en
"}}}
"{{{ Local Leader 
let maplocalleader=" "
autocmd BufNewFile,BufRead * nnoremap <buffer> <localleader>[[ I#{{{  
autocmd BufNewFile,BufRead * nnoremap <buffer> <localleader>]] I#}}}<ESC>
"{{{ Bash autocmd
autocmd FileType bash	    nnoremap <buffer> <localleader>c maggO#!/bin/bash<C-m><ESC>'a
"}}}
"{{{ Python autocmd
autocmd FileType python     nnoremap <buffer> <localleader>3 I#!/usr/bin/env python3<C-m><ESC>
" try and except:
autocmd FileType python     nnoremap <buffer> <localleader>t msVip<ESC>mt<ESC>oexcept:<ESC>k<c-v>'sI    <ESC>O<ESC>itry:<ESC>/except:<C-m>
autocmd FileType python     nnoremap <buffer> <localleader>2 I#!/usr/bin/env python2<C-m><ESC>
autocmd FileType python     nnoremap <buffer> <localleader>' I'''<C-m><++><C-m>'''<ESC>2k0<ESC>
autocmd FileType python     nnoremap <buffer> <localleader>f Ifor <++> in range(<++>,<++>):<C-m><++><ESC>k0
autocmd FileType python     nnoremap <buffer> <localleader>fi Ifor <++> in <++>.split('\n'):<C-m>if '<++>' in <++>:<C-m>print(<++>)<ESC>2k0
autocmd FileType python     nnoremap <buffer> <localleader>im Iimport   
autocmd FileType python     nnoremap <buffer> <localleader>imbs <ESC>mbggofrom bs4 import BeautifulSoup<C-m><ESC>'bibs = BeautifulSoup(<++>,'lxml')<ESC>0
autocmd FileType python     nnoremap <buffer> <localleader>imj <ESC>mjggoimport json<C-m><ESC>'jij = json.loads(<++>)<ESC>0
autocmd FileType python     nnoremap <buffer> <localleader>imo <ESC>moggoimport os<ESC>'o
autocmd FileType python     nnoremap <buffer> <localleader>imr <ESC>mrggoimport requests<C-m><ESC>'rir = requests.get('<++>').text<ESC>0
"autocmd FileType python     nnoremap <buffer> <localleader>imr iimport requests<C-m>r = requests.get('<++>').text<ESC>0
autocmd FileType python     nnoremap <buffer> <localleader>ims Iimport sys<C-m><ESC>
autocmd FileType python     nnoremap <buffer> <localleader>imt <ESC>mtggoimport time<ESC>'titime.sleep(<++>)<ESC>0
autocmd FileType python     nnoremap <buffer> <localleader>o I <++> = open('<++>','<++>')<ESC>0
autocmd FileType python     vnoremap <buffer> <localleader>so :sort<C-m>
autocmd FileType python     inoremap <buffer> 99 (
autocmd FileType python     inoremap <buffer> 00 )
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
"{{{ Testing map
map <F5> :!%:p
"}}}
inoremap jk <ESC>
inoremap kj <ESC>
"}}}
"{{{ Split Navigation
"nmap <silent> <A-Up> :wincmd k<CR>
"nmap <silent> <A-Down> :wincmd j<CR>
"nmap <silent> <A-Left> :wincmd h<CR>
"nmap <silent> <A-Right> :wincmd l<CR>
nmap gh :wincmd h<CR>
nmap gj :wincmd j<CR>
nmap gk :wincmd k<CR>
nmap gl :wincmd l<CR>
"}}}
nmap ? <ESC>:help 
set statusline=%f\ -\ FileType:\ %y
"{{{ Variable
let $BROWSER = 'firefox'
"}}}

let g:netrw_browsex_viewer = $BROWSER
