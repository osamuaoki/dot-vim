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

" Syntax highlight and spelling
syntax on

" Enable filetype based plugin indent control
filetype plugin indent on

" Enable spell check with en_us for all
set spell spelllang=en_us

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
vnoremap Q :norm @q<cr>

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

" Display mode
set nowrap
" Always display the status line
set laststatus=2
" Last line
set showmode
set showcmd
" Tab completion for command
set wildmenu

" Basic precautions (we use bash so $USER is set)
if $USER == "root"
  set noswapfile
endif
" filler to avoid the line above being recognized as a modeline
" filler
" filler
"
" All Vim plugin packages are loaded and processed after this point
" from the subdirectories of ~/.vim/pack/*/start/ etc.
"
" If some special override is needed after loading plugins , place such
" configuration file in ~/.vim/after etc.

