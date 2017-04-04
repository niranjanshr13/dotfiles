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
"{{{ Color Scheme
" http://vimawesome.com
" http://vimcolors.com
colorscheme darkblue
"}}}
"{{{ Setting set
set foldmethod=marker,syntax
set tabstop=4
setlocal foldclose=all
filetype plugin indent on
syntax on
set relativenumber
"}}}
"{{{ Setting of Toggle of rnu and no number
function! NumberToggle()
    if(&rnu == 0)
        set rnu
    else
        set nornu
    endif
endfunction
"}}}
"{{{ Setting key-binding
map <F5> :!%:p
nnoremap <C-l> :call NumberToggle()<CR>
"}}}
