" vimscript helper => https://devhints.io/vimscript
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
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))
" Let NeoBundle manage NeoBundle
" Required:
"NeoBundleFetch 'Shougo/neobundle.vim'
"NeoBundle 'majutsushi/tagbar'
"{{{ ..................... Function plugin 'majutsushi/tagbar'
let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'kinds' : [
        \ 'h:Heading_L1',
        \ 'i:Heading_L2',
        \ 'k:Heading_L3'
    \ ]
\ }
NeoBundleFetch 'vim-syntastic/syntastic'
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
"		"nmap <F8> :TagbarToggle<CR>
""}}}
" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!
call neobundle#end()
"set rtp+=~/.config/nvim/Vundle.vim
"call vundle#begin()
"Plugin 'VundleVim/Vundle.vim'
""Plugin 'andmarti1424/sc-im'
"Plugin 'kien/ctrlp.vim'
"Plugin 'vim-syntastic/syntastic'
""{{{ .......................... Syntax Checking 'vim-syntastic/syntastic'
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:pymode_rope = 0
""}}}
"Plugin 'majutsushi/tagbar'
""{{{ ..................... Function plugin 'majutsushi/tagbar'
"let g:tagbar_type_markdown = {
"    \ 'ctagstype' : 'markdown',
"    \ 'kinds' : [
"        \ 'h:Heading_L1',
"        \ 'i:Heading_L2',
"        \ 'k:Heading_L3'
"    \ ]
"\ }
""}}}
"		"nmap <F8> :TagbarToggle<CR>
"		nmap t :TagbarToggle<CR>
"Plugin 'MarcWeber/vim-addon-mw-utils'
"Plugin 'easymotion/vim-easymotion'
"		" binding easymotion with 's'
"		nmap f <Plug>(easymotion-s)
"		" using both uppercase and lowercase
"		let g:EasyMotion_smartcase = 1
""Plugin 'garbas/vim-snipmate'
""Plugin 'honza/vim-snippets'
""Plugin 'kien/ctrlp.vim'
""Plugin 'tomtom/tlib_vim'
"call vundle#end()
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
set laststatus=0
set encoding=utf-8
set foldmethod=syntax
set foldmethod=marker
set hlsearch
set ignorecase
set relativenumber
set showcmd
set smartcase
set tabstop=4
set shiftwidth=2
set expandtab
    
		
set undolevels=100
setlocal foldclose=all
syntax on
"}}}
let mapleader=","
"{{{ Function
" {{{ "math" vmath plugin-code.
function Math()

		echo 'Math Function is On'

if exists("loaded_vmath")
    finish
endif
let loaded_vmath = 1

" Preserve external compatibility options, then enable full vim compatibility...
let s:save_cpo = &cpo
set cpo&vim

" Grab visual selection and do simple math on it...
function! VMATH_YankAndAnalyse ()
    if &showmode
        " Don't reselect the visual region if showmode is enabled
        " because it will clobber the sum/avg/etc report with the
        " "-- VISUAL --" message.
        return "y:call VMATH_Analyse()\<CR>"
    else
        return "y:call VMATH_Analyse()\<CR>gv"
    endif
endfunction

" What to consider a number...
let s:NUM_PAT = '^[+-]\?\d\+\%([.]\d\+\)\?\([eE][+-]\?\d\+\)\?$'

" How widely to space the report components...
let s:REPORT_GAP = 3  "spaces between components

" Do simple math on current yank buffer...
function! VMATH_Analyse ()
    " Extract data from selection...
    let selection = getreg('')
    let raw_numbers = filter(split(selection), 'v:val =~ s:NUM_PAT')
    let numbers = map(copy(raw_numbers), 'str2float(v:val)')

    " Results include a newline if original selection did...
    let newline = selection =~ "\n" ? "\n" : ""

    " Calculate and en-register various interesting metrics...
    let summation = len(numbers) ? join( numbers, ' + ') : '0'
    call setreg('s', s:tidy( eval( summation )      )) " Sum     --> register s
    call setreg('a',         s:average(raw_numbers)  ) " Average --> register a
    call setreg('x', s:tidy( s:max(numbers)         )) " Max     --> register x
    call setreg('n', s:tidy( s:min(numbers)         )) " Min     --> register n
    call setreg('r',         @n . ' to ' . @x        ) " Range   --> register r
    call setreg('c', len(numbers)                    ) " Count   --> register c

    " Default paste buffer should depend on original contents (TODO)
    call setreg('', @s )

    " Report...
    let gap = repeat(" ", s:REPORT_GAP)
    highlight NormalUnderlined term=underline cterm=underline gui=underline
    echohl NormalUnderlined
    echo  's'
    echohl NONE
    echon  'um: ' . @s . gap
    echohl NormalUnderlined
    echon 'a'
    echohl NONE
    echon  'vg: ' . @a . gap
    echon 'mi'
    echohl NormalUnderlined
    echon   'n'
    echohl NONE
    echon    ': ' . @n . gap
    echon 'ma'
    echohl NormalUnderlined
    echon   'x'
    echohl NONE
    echon    ': ' . @x . gap
    echohl NormalUnderlined
    echon  'c'
    echohl NONE
    echon  'ount: ' . @c

endfunction

" Prettify numbers...
function! s:tidy (number)
    let tidied = printf('%g', a:number)
    return substitute(tidied, '[.]0\+$', '', '')
endfunction

" Compute average with meaningful number of decimal places...
function! s:average (numbers)
    " Compute average...
    let summation = eval( len(a:numbers) ? join( a:numbers, ' + ') : '0' )
    let avg = 1.0 * summation / s:max([len(a:numbers), 1])

    " Determine significant figures...
    let min_decimals = 15
    for num in a:numbers
        let decimals = strlen(matchstr(num, '[.]\d\+$')) - 1
        if decimals < min_decimals
            let min_decimals = decimals
        endif
    endfor

    " Adjust answer...
    return min_decimals > 0 ? printf('%0.'.min_decimals.'f', avg)
    \                       : string(avg)
endfunction

" Reimplement these because the builtins don't handle floats (!!!)
function! s:max (numbers)
    if !len(a:numbers)
        return 0
    endif
    let numbers = copy(a:numbers)
    let maxnum = numbers[0]
    for nextnum in numbers[1:]
        if nextnum > maxnum
            let maxnum = nextnum
        endif
    endfor
    return maxnum
endfunction

function! s:min (numbers)
    if !len(a:numbers)
        return 0
    endif
    let numbers = copy(a:numbers)
    let minnum = numbers[0]
    for nextnum in numbers[1:]
        if nextnum < minnum
            let minnum = nextnum
        endif
    endfor
    return minnum
endfunction
" Restore previous external compatibility options
let &cpo = s:save_cpo
vmap <expr>  ++  VMATH_YankAndAnalyse()
nmap         ++  vip++
endfunction
"}}}
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
nnoremap <leader>f :call FolderToggle()<CR>
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
nnoremap <BS> <NOP>
"}}}
""Normal Mode
nnoremap ; :
"nnoremap : ; "no need because logic"
"{{{ Ex Mode
command Math call Math()
command Q q!
command Wq wq!
"}}}
"{{{ Leader Mode
nnoremap <leader>t gt
nnoremap <leader>q <ESC>:q!
nnoremap <leader>w :wq
nnoremap <leader>. <ESC>:exec '!'.getline('.')
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
"autocmd FileType bash	    nnoremap <buffer> <localleader>c maggO#!/bin/bash<C-m><ESC>'a
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
""Split Navigation
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>
nmap gh :wincmd h<CR>
nmap gj :wincmd j<CR>
nmap gk :wincmd k<CR>
nmap gl :wincmd l<CR>

nmap ? <ESC>:help 
"set statusline=%f\ -\ FileType:\ %y
""Variable
		let $BROWSER = 'firefox'
		let g:netrw_browsex_viewer = $BROWSER
"vnoremap (( "sc(<C-r>s)<Esc>

"" trailing tab, spaces
		exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
		set list
		autocmd FileType python %s/\s\+$//e


augroup vim_ext "{{{
		autocmd!
		autocmd BufNewFile,BufRead *.vim inoremap <buffer> # "
		autocmd BufNewFile,BufRead *.vim inoremap <buffer> ' "
augroup END "}}}
augroup python_autocmd "{{{
		autocmd!
		autocmd FileType python nnoremap <buffer> <localleader>3 maggO#!/usr/bin/python3<ESC>'a
		autocmd FileType python nnoremap <buffer> <localleader>2 maggO#!/usr/bin/python2<ESC>'a
		" try and except:
		autocmd FileType python nnoremap <buffer> <localleader>t msVip<ESC>mt<ESC>oexcept:<ESC>k<c-v>'sI    <ESC>O<ESC>itry:<ESC>/except:<C-m>
		autocmd FileType python nnoremap <buffer> <localleader>' I'''<C-m><++><C-m>'''<ESC>2k0<ESC>
		autocmd FileType python nnoremap <buffer> <localleader>for Ifor <++> in range(<++>,<++>):<C-m><++><ESC>k0
		autocmd FileType python nnoremap <buffer> <localleader>fif Ifor <++> in <++>.split('\n'):<C-m>if '<++>' in <++>:<C-m>print(<++>)<ESC>2k0
		autocmd FileType python nnoremap <buffer> <localleader>imp Iimport 
		autocmd FileType python nnoremap <buffer> <localleader>imbs <ESC>mbggofrom bs4 import BeautifulSoup<C-m><ESC>'bibs = BeautifulSoup(<++>,'lxml')<ESC>0
		autocmd FileType python nnoremap <buffer> <localleader>imj <ESC>mjggoimport json<C-m><ESC>'jij = json.loads(<++>)<ESC>0
		autocmd FileType python nnoremap <buffer> <localleader>imo <ESC>moggoimport os<ESC>'o
		autocmd FileType python nnoremap <buffer> <localleader>imr <ESC>mrggoimport requests<C-m><ESC>'rir = requests.get('<++>').text<ESC>0
		"autocmd FileType python nnoremap <buffer> <localleader>imr iimport requests<C-m>r = requests.get('<++>').text<ESC>0
		autocmd FileType python nnoremap <buffer> <localleader>ims Iimport sys<C-m><ESC>
		autocmd FileType python nnoremap <buffer> <localleader>imt <ESC>mtggoimport time<ESC>'titime.sleep(<++>)<ESC>0
		autocmd FileType python nnoremap <buffer> <localleader>o I= open('<++>','<++>')<C-m>f = f.read()<ESC>0ki
		"autocmd FileType python vnoremap <buffer> <localleader>so :sort<C-m>
		autocmd FileType python nnoremap <buffer> <localleader>9 a(
		autocmd FileType python nnoremap <buffer> <localleader>0 a)
augroup END "}}}

" all in one SheBang
autocmd BufNewFile *.sh :call SheBangy("bash")
autocmd FileType python :call SheBangy("python")
function! SheBangy(filetype)
	let firstLine = getline(1)

	if(a:filetype == "python")
		if(firstLine == "#!/usr/bin/python3") || (firstLine == "#!/usr/bin/python2")
				"silent !echo SheBang Already Implemented.
		else
				exec "normal! ggO#!/usr/bin/python3\<C-m>"
		endif
    endif

	if(a:filetype == "bash")
		if(firstLine == "#!/bin/bash")
		else
			exec "normal! ggO#!/bin/bash\<C-m>"
		endif
    endif
endfunction
