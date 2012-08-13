" =================
" Basic UX Settings
" =================

cd ~/Dropbox

set go-=m
set go-=T
set go-=r

set t_vb=
set noeb vb t_vb=
if has('autocmd')
    autocmd GUIEnter * set vb t_vb=
endif

au BufNewFile,BufRead *.txt,*.text  setf text

filetype on
filetype plugin on
filetype plugin indent on

nnoremap <C-F1> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>
nnoremap <C-F2> :if &go=~#'T'<Bar>set go-=T<Bar>else<Bar>set go+=T<Bar>endif<CR>
nnoremap <C-F3> :if &go=~#'r'<Bar>set go-=r<Bar>else<Bar>set go+=r<Bar>endif<CR>

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
set textwidth=74    " wrap lines at 80 chars
set colorcolumn=+1  " highlight column after 'textwidth'
"set colorcolumn=80  " highlight column after 80 chars
highlight ColorColumn ctermbg=lightgrey guibg=lightgrey
set autoindent      " use indent of previous line
set smartindent     " use intelligent indentation for C
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
setlocal guifont=DejaVu\ Sans\ Mono\ 11
"colorscheme wombat256mod
"colorscheme oceanblack
colorscheme wombat256

" intelligent comments
set comments=s1:/*,mb:\ ",elx:\ */

" OmniCPPComplete
set nocp
filetype plugin on
set tags+=~/.vim/tags/cpp
" will recursively build a ctags database from the current directory
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

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

