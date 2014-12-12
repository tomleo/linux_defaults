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
let NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let NERDTreeShowBookmarks=1

set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|tox)$'
let g:ctrlp_user_command = "find %s -type f | grep -Ev '"+ g:ctrlp_custom_ignore +"'"
let g:ctrlp_use_caching = 0
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_root_markers = '/home/tom/energysage/'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite

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
"set colorcolumn=99  " highlight column after 80 chars

set textwidth=0 wrapmargin=0
set nowrap



" See http://stackoverflow.com/a/235970/465270
"highlight colorcolumn ctermbg=lightgrey guibg=#888888
"highlight OverLength ctermbg=lightgrey ctermfg=black guibg=#888888
"highlight ColorColumn ctermbg=233
"====[ Make the 81st column stand out ]====================
    " just the 100th column of wide lines...
    highlight ColorColumn ctermbg=magenta
    call matchadd('ColorColumn', '\%99v', 119)

set autoindent      " use indent of previous line

"" Smart Indent is responsible for making the # tag jump to col0
" see http://vim.wikia.com/wiki/Restoring_indent_after_typing_hash
" set smartindent     " use intelligent indentation for C
" furthermore smartindent has been depreciated in favor of 'cindent'
set showmatch

" ========
" Add-on's
" ========


" syntax highlighting on
set t_Co=256
syntax on
"set guifont=DejaVu\ Sans\ Mono\ 9
set guifont=Inconsolata\ Medium\ 9
"setlocal guifont=Anonymous_Pro:h11
"setlocal guifont=Anonymous\ Pro\ 9
"setlocal guifont=Source\ Code\ Pro\ 10

"colorscheme oceanblack
""colorscheme wombat256
"colorscheme kate
if has('gui_running')
    colorscheme wombat256mod
    setlocal guifont=Inconsolata\ Medium\ 9
    "setlocal guifont=DejaVu\ Sans\ Mono\ 9
    "setlocal guifont=Anonymous\ Pro\ 9
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

map <C-H> <C-W>h<C-W>h
map <C-L> <C-W>l<C-W>l
nmap <c-j> <c-w>j<c-w>j
nmap <c-k> <c-w>k<c-w>k

let jshint2_save = 0

"====[ Swap : and ; to make colon commands easier to type ]======

    nnoremap  ;  :
    nnoremap  :  ;

"====[ Copy to Clipboard ]====
" Visualmode is not via CTRL-Q instead of CTRL-V
source $VIMRUNTIME/mswin.vim
behave mswin
"vmap <C-c> "+y
"vmap <C-x> "+c
"vmap <C-v> c<ESC>"+p
"imap <C-v> <C-r><C-o>+
set clipboard^=unnamed

"====[ Drag Visual Plugin ]====
runtime plugin/dragvisuals.vim 
vmap  <expr>  <LEFT>   DVB_Drag('left')
vmap  <expr>  <RIGHT>  DVB_Drag('right')
vmap  <expr>  <DOWN>   DVB_Drag('down')
vmap  <expr>  <UP>     DVB_Drag('up') 
vmap  <expr>  D        DVB_Duplicate() 

" Remove any introduced trailing whitespace after moving...
let g:DVB_TrimWS = 1


"====[ Open Current line on GitHub ]====
noremap ,o :!echo `git url`/blob/`git rev-parse --abbrev-ref HEAD`/%\#L<C-R>=line('.')<CR> \| xargs open<CR><CR>


"====[ Custom Python things ]====
"autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8 colorcolumn=99
"   \ formatoptions+=croq softtabstop=4 smartindent
"   \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
autocmd FileType python setlocal formatoptions+=croq 
    \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with


"====[ Jedi-vim ]====
let g:jedi#popup_on_dot = 0
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = "0"
let g:jedi#completions_command = "<C-Space>"


set ttyfast
set binary


"" Disable the blinking cursor.
set gcr=a:blinkon0
set scrolloff=3

set title
set titleold="Terminal"
set titlestring=%F


let g:airline_theme = 'powerlineish'
let g:airline_enable_branch = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'


set tabstop=4		" tab width is 4 spaces
set shiftwidth=4	" indent with 4 spaces
set expandtab		" expand tabs to spaces


au BufNewFile,BufRead *.lg set filetype=worklogfile
autocmd FileType worklogfile setlocal guifont=DejaVu\ Sans\ Mono\ 9 tabstop=2 shiftwidth=2 expandtab



""" vim-notes
let g:notes_directories = ['~/work/notes/']
let g:notes_suffix = '.note'
let g:notes_smart_quotes = 1


