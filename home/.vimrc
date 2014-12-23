" ==================
" Package Management
" ==================

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'  " let Vundle manage Vundle, required
Plugin 'rking/ag.vim'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'kien/ctrlp.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tmhedberg/SimpylFold'
Plugin 'majutsushi/tagbar'
Plugin 'skammer/vim-css-color'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'rbgrouleff/bclose.vim'
Plugin 'mrtazz/DoxygenToolkit.vim'
Plugin 'shinokada/dragvisuals.vim'
Plugin 'vim-scripts/spacehi.vim'
Plugin 'vim-scripts/taglist.vim'
call vundle#end()

" ==============
" Basic Settings
" ==============

cd ~
set ttyfast
set binary
set gcr=a:blinkon0  " Disable the blinking cursor
set scrolloff=3     " 3 lines visible above below the cursor
set title
set titleold="Terminal"
set titlestring=%F
set tabstop=4		" tab width is 4 spaces
set shiftwidth=4	" indent with 4 spaces
set expandtab		" expand tabs to spaces
set hlsearch
set incsearch " start searching when you type the first character of the search string
set ignorecase
map <C-H> <C-W>h<C-W>h
map <C-L> <C-W>l<C-W>l
nmap <c-j> <c-w>j<c-w>j
nmap <c-k> <c-w>k<c-w>k
map <C-J> :bnext<CR>
map <C-K> :bprev<CR>
set nowrap
set showmatch       " highlight matching braces
set tabstop=4		" tab width is 4 spaces
set shiftwidth=4	" indent with 4 spaces
set expandtab		" expand tabs to spaces
set autoindent      " use indent of previous line
set textwidth=0 wrapmargin=0
set nocp
set comments=s1:/*,mb:\ ",elx:\ */ " intelligent comments

"====[ Copy to Clipboard ]==========================="

    " Visualmode is not via CTRL-Q instead of CTRL-V
    source $VIMRUNTIME/mswin.vim
    behave mswin
    set clipboard^=unnamed

"====[ UTF-8 all the things ]================"

    if has("multi_byte")
      if &termencoding == ""
        let &termencoding = &encoding
      endif
      set encoding=utf-8
      setglobal fileencoding=utf-8
      "setglobal bomb
      set fileencodings=ucs-bom,utf-8,latin1
    endif
    nnoremap <F12> :e ++enc=utf-8<CR>

"====[ UI Settings - Hide menu and scroll bars ===="

    set go-=m " Hide Menu
    set go-=T " HIde Toolbar
    "set go-=r " Hide Scroll Bar
    nnoremap <C-F1> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>
    nnoremap <C-F2> :if &go=~#'T'<Bar>set go-=T<Bar>else<Bar>set go+=T<Bar>endif<CR>
    nnoremap <C-F3> :if &go=~#'r'<Bar>set go-=r<Bar>else<Bar>set go+=r<Bar>endif<CR>

"====[ UI Settings - Color Scheme ]===="

    syntax on
    set t_Co=256
    set guifont=Inconsolata\ Medium\ 9
    "set guifont=DejaVu\ Sans\ Mono\ 9
    "set guifont=Anonymous_Pro:h11
    "set guifont=Anonymous\ Pro\ 9
    "set guifont=Source\ Code\ Pro\ 10
    "colorscheme oceanblack
    "colorscheme wombat256
    "colorscheme kate
    "colorscheme pyte
    "colorscheme eclipse
    if has('gui_running')
        colorscheme wombat256mod
        setlocal guifont=Inconsolata\ Medium\ 9
        map <D-S-LEFT> <C-w>W
    else
        colorscheme wombat
    endif

"====[ UI Settings - Code Folding ]===="

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

"====[ Swap : and ; to make colon commands easier to type ]======"

    nnoremap  ;  :
    nnoremap  :  ;

"====[ File type settings ]===="

    filetype plugin on
    filetype plugin indent on

    au BufNewFile,BufRead *.txt,*.text  setf text
    au BufNewFile,BufRead *.haml,*.hamlbars setf haml
    au BufNewFile,BufRead *.lg setf worklogfile

    au FileType python setlocal formatoptions+=croq 
        \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
    au FileType worklogfile setlocal guifont=DejaVu\ Sans\ Mono\ 9 tabstop=2 shiftwidth=2 expandtab


"====[ Disable Beeping ]===="

    set t_vb=
    set noeb vb t_vb=
    if has('autocmd')
        autocmd GUIEnter * set vb t_vb=
    endif



" =====================
" Basic Plugin Settings
" =====================

" scrooloose/nerdtree
let NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let NERDTreeShowBookmarks=1

" kien/ctrlp.vim
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|tox)$'
let g:ctrlp_user_command = "find %s -type f | grep -Ev '"+ g:ctrlp_custom_ignore +"'"
let g:ctrlp_use_caching = 0
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_root_markers = '/home/tom/energysage/'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite

" jlanzarotta/bufexplorer
noremap <silent> <F11> :BufExplorer<CR>
noremap <silent> <m-F11> :BufExplorerHorizontalSplit<CR>
noremap <silent> <c-F11> :BufExplorerVerticalSplit<CR>

" davidhalter/jedi-vim
let g:jedi#popup_on_dot = 0
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = "0"
let g:jedi#completions_command = "<C-Space>"

" mrtazz/DoxygenToolkit.vim
let g:DoxygenToolkit_authorName="Tom Leo <tom@tomleo.com>"

" shinokada/dragvisuals.vim
runtime plugin/dragvisuals.vim 
vmap  <expr>  <LEFT>   DVB_Drag('left')
vmap  <expr>  <RIGHT>  DVB_Drag('right')
vmap  <expr>  <DOWN>   DVB_Drag('down')
vmap  <expr>  <UP>     DVB_Drag('up') 
vmap  <expr>  D        DVB_Duplicate() 
let g:DVB_TrimWS = 1 " Remove any introduced trailing whitespace after moving...


" ===========
" Custom Code
" ===========

"====[ modify selected text using combining diacritics ]======================="

    command! -range -nargs=0 Overline        call s:CombineSelection(<line1>, <line2>, '0305')
    command! -range -nargs=0 Underline       call s:CombineSelection(<line1>, <line2>, '0332')
    command! -range -nargs=0 DoubleUnderline call s:CombineSelection(<line1>, <line2>, '0333')
    command! -range -nargs=0 Done   call s:CombineSelection(<line1>, <line2>, '0336')

    function! s:CombineSelection(line1, line2, cp)
      execute 'let char = "\u'.a:cp.'"'
      execute a:line1.','.a:line2.'s/\%V[^[:cntrl:]]/&'.char.'/ge'
    endfunction

"====[ Make the 119st column stand out ]===================="

    " See http://stackoverflow.com/a/235970/465270
    "set textwidth=74    " wrap lines at 80 chars
    "set colorcolumn=+1  " highlight column after 'textwidth'
    "set colorcolumn=99  " highlight column after 80 chars
    "highlight colorcolumn ctermbg=lightgrey guibg=#888888
    "highlight OverLength ctermbg=lightgrey ctermfg=black guibg=#888888
    "highlight ColorColumn ctermbg=233

    " just the 100th column of wide lines...
    highlight ColorColumn ctermbg=magenta
    call matchadd('ColorColumn', '\%99v', 119)

"====[ TODO ]===="

    " OmniCPPComplete
    set tags+=~/.vim/tags/cpp
    " will recursively build a ctags database from the current directory
    map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
    autocmd FileType python set omnifunc=pythoncomplete#Complete
    autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
    autocmd FileType css set omnifunc=csscomplete#CompleteCSS
    """ ctags related stuff
    nmap <F8> :TagbarToggle<CR>

