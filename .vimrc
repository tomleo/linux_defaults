" use indent of previous line
set autoindent

" use intelligent indentation for C
set smartindent

" tab widths
set tabstop=4		" tab width is 4 spaces
set shiftwidth=4	" indent with 4 spaces
set expandtab		" expand tabs to spaces

" wrap lines at 80 chars
set textwidth=80

" syntax highlighting on
set t_Co=256
syntax on
"colorscheme wombat256mod
"colorscheme oceanblack
colorscheme wombat256

" highlight matching braces
set showmatch

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

set nowrap

" Code folding via syntax
setlocal foldmethod=syntax


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
  setlocal foldcolumn=4
endif
