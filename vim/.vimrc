"{{{ Tips
"Fixing vundle
"	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"Vim Websites
"       http://vim.wikia.com/wiki/Special:Random
" Setting up different .vimrc file
" - vim --cmd 'set rtp^=alternate_dir'
"}}}
"{{{ Installing Plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'kien/ctrlp.vim'
Plugin 'tomtom/tlib_vim'
"Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'
"Plugin 'flazz/vim-colorschemes'
"Plugin 'valloric/youcompleteme'
"	let g:ycm_python_binary_path = '/usr/bin/env python3'
call vundle#end()
"}}}
"{{{ Color Scheme
" http://vimawesome.com
" http://vimcolors.com
colorscheme Revolution 
colorscheme base
"colorscheme darkblue
"}}}
"{{{ Setting set
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
"{{{ Function
"{{{ Function: Toggle of rnu and no
nnoremap <leader>l :call NumberToggle()<CR>
function! NumberToggle()
    if(&rnu == 0)
        set rnu
    else
        set nornu
    endif
endfunction
"}}}
"{{{ Function: Toggle mouse mode
nnoremap <leader>m :call MouseToggle()<CR>
function! MouseToggle()
	if(&mouse == 'a')
		set mouse=
	else
		set mouse=a 
	endif
endfunction
"}}}
"}}}
"{{{ Mapping Keys
"{{{ Disabling Key
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
nnoremap <C-m> <NOP>
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
let mapleader=","
nnoremap <leader>t gt
"}}}
nnoremap <space><space> <Esc>/<++><Enter>"_c4l
"}}}
"{{{ Autocmd
autocmd BufNewFile,BufRead *.md setlocal spell
"}}}
"{{{ Local Leader 
let maplocalleader=" "
autocmd BufNewFile,BufRead * nnoremap <buffer> <localleader>[[ I#{{{  <++><C-m>#}}}<esc>k3l
"{{{ Bash autocmd
autocmd FileType bash	    nnoremap <buffer> <localleader># I#!/bin/bash<C-m><esc> 
"}}}
"{{{ Python autocmd
autocmd FileType python     nnoremap <buffer> <localleader># I#!/usr/bin/env python3<C-m><esc>
autocmd FileType python     nnoremap <buffer> <localleader>' I'''<C-m><++><C-m>'''<esc>2k0<esc>
autocmd FileType python     nnoremap <buffer> <localleader>f Ifor <++> in range(<++>,<++>):<C-m><++><esc>k0
autocmd FileType python     nnoremap <buffer> <localleader>fi Ifor <++> in <++>.split('\n'):<C-m>if '<++>' in <++>:<C-m>print(<++>)<esc>2k0
autocmd FileType python     nnoremap <buffer> <localleader>im Iimport   
autocmd FileType python     nnoremap <buffer> <localleader>imbs Ifrom bs4 import BeautifulSoup<C-m>
autocmd FileType python     nnoremap <buffer> <localleader>imo Iimport os<C-m><esc>
autocmd FileType python     nnoremap <buffer> <localleader>imr iimport requests<C-m>r = requests.get('<++>')<C-m>rx = r.text<esc>2k
autocmd FileType python     nnoremap <buffer> <localleader>ims Iimport sys<C-m><esc>
autocmd FileType python     nnoremap <buffer> <localleader>imt Iimport time<C-m><esc>
autocmd FileType python     nnoremap <buffer> <localleader>imt Iimport time<C-m><esc>
autocmd FileType python     nnoremap <buffer> <localleader>o I = open('<++>','w')<esc>0i
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
command VundleGitInstall :! git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim 
"}}}
"{{{ Testing map
map <F5> :!%:p
"}}}
inoremap jk <esc>
"}}}
