" ==================
" Package Management
" ==================

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=/home/tom/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('/home/tom/.vim/bundle'))
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'rking/ag.vim'
NeoBundle 'jlanzarotta/bufexplorer'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tmhedberg/SimpylFold' " Python Code Folding
NeoBundle 'majutsushi/tagbar'
NeoBundle 'ap/vim-css-color' " ap fork is more activly maintained
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'vim-scripts/taglist.vim' " source code browser plugin
NeoBundle 'mustache/vim-mustache-handlebars'
NeoBundle 'bkad/CamelCaseMotion'
NeoBundle 'Keithbsmiley/investigate.vim'
NeoBundle 'chriskempson/base16-vim'
" NeoBundle 'amoffat/snake'
NeoBundle 'NLKNguyen/papercolor-theme'
NeoBundle 'kristijanhusak/vim-hybrid-material'
NeoBundle 'vim-scripts/restore_view.vim'
NeoBundle 'vim-scripts/SeeTab'
NeoBundle 'tpope/vim-fireplace.git'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'dag/vim-fish'

call neobundle#end()

filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

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
set hlsearch
set incsearch " start searching when you type the first character of the search string
set ignorecase
map <c-j> <c-w>j
map <c-k> <c-w>k
map <C-h> <C-W>h
map <C-l> <C-W>l

set nowrap
set showmatch       " highlight matching braces
set autoindent      " use indent of previous line
set textwidth=0 wrapmargin=0
set nocp
set comments=s1:/*,mb:\ ",elx:\ */ " intelligent comments

"====[ Copy to Clipboard ]==========================="

    " Visualmode is not via CTRL-Q instead of CTRL-V
    source $VIMRUNTIME/mswin.vim
    behave mswin
    "set clipboard^=unnamed

    "This is for X11 PRIMARY selection
    set clipboard+=unnamed,unnamedplus

    " set clipboard*=unnamedplus "This is for X11 CLIPBOARD selection


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

"====[ Terminal Emulator Settings ]===="

tnoremap <Esc> <C-\><C-n> " Exit Terminal Mode
" Exit Terminal mode and switch buffers
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
" Switch Buffers using meta key
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

"====[ UI Settings - Color Scheme ]===="

    syntax on
    set t_Co=256
    
    " Base16 Settings
    let base16colorspace=256 " Access colors present in 256 colorspace
    set background=dark

    set guifont=Inconsolata\ Medium\ 9
    "set guifont=DejaVu\ Sans\ Mono\ 9
    "set guifont=Anonymous_Pro:h11
    "set guifont=Anonymous\ Pro\ 9
    "set guifont=Source\ Code\ Pro\ 10
    if has('gui_running')
        colorscheme wombat256mod
        "colorscheme oceanblack
        "colorscheme wombat256
        "colorscheme kate
        "colorscheme pyte
        "colorscheme eclipse
        "colorscheme PaperColor
        let g:enable_bold_font = 1
        "colorscheme hybrid_material
        map <D-S-LEFT> <C-w>W
        set lines=999 columns=99
    else
        colorscheme wombat256mod
    endif

"====[ Swap : and ; to make colon commands easier to type ]======"

    nnoremap  ;  :
    nnoremap  :  ;


"====[ File type settings ]===="

    filetype plugin indent on

    au BufNewFile,BufRead *.txt,*.text  setf text
    au BufNewFile,BufRead *.haml,*.hamlbars setf haml
    au BufNewFile,BufRead *.lg setf worklogfile

    "au FileType python setlocal formatoptions+=croq 
    "    \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
    au FileType worklogfile setlocal guifont=Ubuntu\ Mono\ 10 tabstop=4 shiftwidth=4 expandtab
    au Filetype gitcommit setlocal spell textwidth=72


"====[ Disable Beeping ]===="

    set t_vb=
    set noeb vb t_vb=
    if has('autocmd')
        autocmd GUIEnter * set vb t_vb=
    endif

"====[ Tmux Integration ]===="
" let g:tmux_navigator_no_mappings = 1
" nnoremap <silent> {Left-mapping} :TmuxNavigateLeft<cr>
" nnoremap <silent> {Down-Mapping} :TmuxNavigateDown<cr>
" nnoremap <silent> {Up-Mapping} :TmuxNavigateUp<cr>
" nnoremap <silent> {Right-Mapping} :TmuxNavigateRight<cr>
" nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>
" let g:tmux_navigator_save_on_switch = 1  " Auto-save when leaving pane

" =====================
" Basic Plugin Settings
" =====================

" scrooloose/nerdtree
let NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let NERDTreeShowBookmarks=1

" youcompleteme
" let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
" let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
" let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
" let g:ycm_complete_in_comments = 1 " Completion in comments
" let g:ycm_complete_in_strings = 1 " Completion in string

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

" rking/ag
if executable('ag')
    " Note we extract the column as well as the file and line number
    set grepprg=ag\ --nogroup\ --nocolor
    set grepformat=%f:%l:%c%m
endif
let g:ag_prg="ag -v"

" Keithbsmiley/investigate.vim
let g:investigate_use_dash=1
let g:investigate_command_for_python = '/usr/bin/zeal --query ^s'

" majutsushi/tagbar
nmap <F8> :TagbarToggle<CR>


" vim-scripts/taglist.vim
left g:Tlist_Ctags_Cmd = '/usr/bin/ctags'
nnoremap <silent> <F8> :TlistToggle<CR>
let Tlist_Use_Right_Window = 1
let Tlist_WinWidth = 50 "This works well for longer Class and Function names

" vim-scripts/restore_view.vim
set viewoptions=cursor,folds,slash,unix


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


"====[ Basic Styling END ]===="

    " For some reason VIM will change spaces to tabs, I'm not sure where the
    " offending vimscript code is

    set tabstop=4		" tab width is 4 spaces
    set shiftwidth=4	" indent with 4 spaces
    set expandtab		" always uses spaces instead of tab characters


" Workaround for Virtualenv support
let g:python_host_prog="/home/tom/energysage/env/bin/python"
