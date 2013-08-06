" =================
" Basic UX Settings
" =================

cd ~

set go-=m
set go-=T
"set go-=r

set t_vb=
set noeb vb t_vb=
if has('autocmd')
    autocmd GUIEnter * set vb t_vb=
endif

au BufNewFile,BufRead *.txt,*.text  setf text
au BufNewFile,BufRead *.haml,*.hamlbars setf haml

filetype off
call pathogen#infect()
let NERDTreeIgnore = ['\.pyc$']

set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip 

filetype plugin indent on

nnoremap <C-F1> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>
nnoremap <C-F2> :if &go=~#'T'<Bar>set go-=T<Bar>else<Bar>set go+=T<Bar>endif<CR>
nnoremap <C-F3> :if &go=~#'r'<Bar>set go-=r<Bar>else<Bar>set go+=r<Bar>endif<CR>

noremap <silent> <F11> :BufExplorer<CR>
noremap <silent> <m-F11> :BufExplorerHorizontalSplit<CR>
noremap <silent> <c-F11> :BufExplorerVerticalSplit<CR>

map <C-J> :bnext<CR>
map <C-K> :bprev<CR>

"Move between windows easily
"map <C-H> :wincmd<C-J> <C-W>j
"map <C-L> :wincmd<C-K> <C-W>k

" modify selected text using combining diacritics
command! -range -nargs=0 Overline        call s:CombineSelection(<line1>, <line2>, '0305')
command! -range -nargs=0 Underline       call s:CombineSelection(<line1>, <line2>, '0332')
command! -range -nargs=0 DoubleUnderline call s:CombineSelection(<line1>, <line2>, '0333')
command! -range -nargs=0 Done   call s:CombineSelection(<line1>, <line2>, '0336')

function! s:CombineSelection(line1, line2, cp)
  execute 'let char = "\u'.a:cp.'"'
  execute a:line1.','.a:line2.'s/\%V[^[:cntrl:]]/&'.char.'/ge'
endfunction

nnoremap <F12> :e ++enc=utf-8<CR>

if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  "setglobal bomb
  set fileencodings=ucs-bom,utf-8,latin1
endif

set nowrap
set showmatch       " highlight matching braces
set tabstop=4		" tab width is 4 spaces
set shiftwidth=4	" indent with 4 spaces
set expandtab		" expand tabs to spaces
"set textwidth=74    " wrap lines at 80 chars
"set colorcolumn=+1  " highlight column after 'textwidth'
set colorcolumn=80  " highlight column after 80 chars


" See http://stackoverflow.com/a/235970/465270
"highlight colorcolumn ctermbg=lightgrey guibg=#888888
"highlight OverLength ctermbg=lightgrey ctermfg=black guibg=#888888
highlight ColorColumn ctermbg=233

set autoindent      " use indent of previous line

"" Smart Indent is responsible for making the # tag jump to col0
" see http://vim.wikia.com/wiki/Restoring_indent_after_typing_hash
" set smartindent     " use intelligent indentation for C
" furthermore smartindent has been depreciated in favor of 'cindent'
set showmatch

" Visualmode is not via CTRL-Q instead of CTRL-V
source $VIMRUNTIME/mswin.vim
behave mswin

" ========
" Add-on's
" ========


" syntax highlighting on
set t_Co=256
syntax on
"setlocal guifont=Anonymous_Pro:h11
"setlocal guifont=Anonymous\ Pro\ 11
setlocal guifont=DejaVu\ Sans\ Mono\ 10
"setlocal guifont=Source\ Code\ Pro\ 10

"colorscheme oceanblack
""colorscheme wombat256
"colorscheme kate
if has('gui_running')
    colorscheme wombat256mod
    "colorscheme pyte
    map <D-S-LEFT> <C-w>W
else
    colorscheme wombat
endif

" intelligent comments
set comments=s1:/*,mb:\ ",elx:\ */

" OmniCPPComplete
set nocp
filetype plugin on
set tags+=~/.vim/tags/cpp
" will recursively build a ctags database from the current directory
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

" DoxygenToolkit
let g:DoxygenToolkit_authorName="Tom Leo <tom@tomleo.com>"

" VIM's command window ('q:') and the :options window also set filetype=vim. We
" do not want folding in these enabled by default, though, because some
" malformed :if, :function, ... commands would fold away everything from the
" malformed command until the last command.
if bufname('') =~# '^\%(' . (v:version < 702 ? 'command-line' : '\[Command Line\]') . '\|option-window\)$'
  " With this, folding can still be enabled easily via any zm, zc, zi, ...
  " command.
  setlocal nofoldenable
else
  " Fold settings for ordinary windows.
  setlocal foldcolumn=1
endif

let g:pymode_lint_cwindow = 0

set hlsearch
set incsearch " start searching when you type the first character of the search string
set ignorecase

set tw=79 " width of document (used by gd)
set fo-=t " don't automatically wrap text when typing

map <C-H> <C-W>h<C-W>h
map <C-L> <C-W>l<C-W>l
nmap <c-j> <c-w>j<c-w>j
nmap <c-k> <c-w>k<c-w>k

