"{{{ Tips
"Fixing vundle
"	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"Vim Websites
"       http://vim.wikia.com/wiki/Special:Random
" Setting up different .vimrc file
" 		vim --cmd 'set rtp^=alternate_dir'
"}}}
"{{{ Installing Plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'kien/ctrlp.vim'
Plugin 'tomtom/tlib_vim'
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
set foldmethod=marker,syntax
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
"{{{ Function: Toggle of rnu and no
nnoremap <C-l> :call NumberToggle()<CR>
function! NumberToggle()
    if(&rnu == 0)
        set rnu
    else
        set nornu
    endif
endfunction
"}}}
"{{{ Function: Toggle mouse mode
nnoremap <C-z> :call MouseToggle()<CR>
function! MouseToggle()
	if(&mouse == 'a')
		set mouse=
	else
		set mouse=a 
	endif
endfunction
"}}}
"{{{ Mapping Keys
"{{{ Disabling Arrow Key
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
"}}}
"{{{ Normal Mode
nnoremap ; :
nnoremap <C-m> <NOP>
nnoremap <BS> <NOP>
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
"}}}
"{{{ Testing
"{{{ Installing Vundle
command VundleGitInstall :! git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim 
"}}}
#{{{ Testing map
map <F5> :!%:p
#}}}
"}}}
