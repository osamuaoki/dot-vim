" vim: set sw=2 sts=2 et ft=vim :
" Just to be sure (default for Debian)
if &compatible|set nocompatible|endif

" Set by debian.vimi (default for Debian)
"set runtimepath=~/.vim,/var/lib/vim/addons,/usr/share/vim/vimfiles,/usr/share/vim/vim81,/usr/share/vim/vimfiles/after,/var/lib/vim/addons/after,~/.vim/after

" more powerful backspacing (default for Debian)
set backspace=indent,eol,start

" keep 50 lines of command line history (default for Debian)
set history=50

" show the cursor position all the time (default for Debian)
set ruler

" ignore for file name completion (default for Debian)
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

" minimalist non-filetype-specific indenting
set autoindent
" More than autoindent
set smartindent

" make vim copy buffer bigger (default 50 lines: viminfo='100,<50,s10,h)
set viminfo='100,<5000,s100,h

" Enable 256 colors (TERM=xterm-256color)
set t_Co=256
"set t_AB=^[[48;5;%dm
"set t_AF=^[[38;5;%dm
" Available color schemes
" blue darkblue default delek desert elflord evening industry koehler morning
" murphy pablo peachpuff ron shine slate torte zellner
"set background=light
set background=dark
colorscheme  murphy
"colorscheme  industry
"colorscheme  torte

" Syntax highlight and spelling
syntax on
"syntax off

" Enable filetype based plugin indent control
filetype plugin indent on

" Disable spell check with en_us for all
set nospell " set spell when needed or by FT
" Sell check with en_us
set spelllang=en_us

" minimalist encoding as utf-8
set encoding=utf-8
set fileencodings=utf-8

" Turn off bell and use visualbell
"set visualbell
" Turn off bell and visualbell
set visualbell t_vb=

" Set-up buffer pasting
set nopaste
set pastetoggle=<f2>

" Remap to apply Macro with "Q" ("qq" to record, "q" to quit, "Q" to apply)
nnoremap Q @q
xnoremap Q :norm @q<cr>

" Remap quick jk to to get out from insert mode
inoremap jk  <Esc>

" Remap in visual mode < > related
xnoremap > >gv
xnoremap < <gv
xnoremap <Tab> >gv
xnoremap <S-Tab> <gv
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
inoremap <S-Tab> <C-D>

" Rendering fast
set ttyfast
" Cursor motion
set scrolloff=5
set nostartofline

" open another file without saving the current file
set hidden
" Alternative -- always write
" set confirm
" set autowriteall

" When the last window have a status line: Always=2
set laststatus=2
" Maximum internal statusline with full path
set statusline=%<%F%m%r%h%w[U+%04B]%=[%{&ff}]%y\ (%4l/%4L,%3c%V)\ %P
"              | | | | | |    |    |  |      |     |   |  |  |    +-- current % into file
"              | | | | | |    |    |  |      |     |   |  |  +-- Virtual column number
"              | | | | | |    |    |  |      |     |   |  +-- current column
"              | | | | | |    |    |  |      |     |   +-- number of lines
"              | | | | | |    |    |  |      |     +-- current line
"              | | | | | |    |    |  |      +-- current syntax
"              | | | | | |    |    |  +-- current fileformat
"              | | | | | |    |    +-- separation point
"              | | | | | |    +  Unicode (hex)
"              | | | | | +-- preview flag in square brackets
"              | | | | +-- help flag in square brackets
"              | | | +-- readonly flag in square brackets
"              | | +-- modified flag in square brackets
"              | +-- full path to file in the buffer
"              +-- truncate here
" Maximum internal statusline with full path from PWD or as typed
" set statusline=%<%f%m%r%h%w[U+%04B]%=[%{&ff}]%y\ (%4l/%4L,%3c%V)\ %P
" Maximum internal statusline with file name (tail)
" set statusline=%<%t%m%r%h%w[U+%04B]%=[%{&ff}]%y\ (%4l/%4L,%3c%V)\ %P
"
" Display mode
set nowrap
" Insert, Replace or Visual mode put a message on the last line
set showmode
" Show (partial) command in the last line
set showcmd
" Tab completion for command
set wildmenu

" Basic precautions (we use bash so $USER is set)
if $USER == "root"
  set noswapfile
endif
"
" Source pre-configuration (in alphabetical order per directory)
" for vimconf selected plugins
runtime! conf/preconf.enabled/*

" All Vim plugin packages are loaded and processed after this point
" from the subdirectories of ~/.vim/pack/*/start/ etc.
"
" If some special override is needed after loading plugins , place such
" configuration file in ~/.vim/after etc.

