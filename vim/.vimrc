"{{{ Tips
"Fixing vundle
"	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"Vim Websites
"       http://vim.wikia.com/wiki/Special:Random
"}}}
"{{{ Installing Plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'flazz/vim-colorschemes'
Plugin 'valloric/youcompleteme'
	let g:ycm_python_binary_path = '/usr/bin/env python3'

call vundle#end()
"}}}

" setting foldclose  
"	setlocal foldmethod=indent
	setlocal foldclose=all

"{{{ Color Scheme
" http://vimawesome.com
" http://vimcolors.com
colorscheme darkblue
"}}}
"{{{ Setting set
set foldmethod=marker
set relativenumber
filetype on
syntax on
filetype plugin indent on
setlocal foldmethod=syntax
"}}}
"{{{ Setting key-binding
map <F5> :!%:p
"}}}
