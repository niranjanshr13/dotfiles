" fix vundle
"	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" cool vim theme color
" 	http://vimawesome.com , vimcolors.com

" Plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
	filetype on
	syntax on
	filetype plugin indent on
	setlocal foldmethod=syntax
Plugin 'honza/vim-snippets'
Plugin 'flazz/vim-colorschemes'
	colorscheme elflord
Plugin 'valloric/youcompleteme'
	let g:ycm_python_binary_path = '/usr/bin/python3'


call vundle#end()


" setting foldclose  
"	setlocal foldmethod=indent
	setlocal foldclose=all
	set foldmethod=marker
" run command in vim
	map <F5> :!%:p
