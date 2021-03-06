"
" Initialize and Load Plugins configured by vimconf
"
" I created this while reading sensible.vim by Tim Pope
"
" Maintainer: Osamu Aoki <osamu@debian.org>
" Version: 0.0
"

" Just to be sure (default for Debian)
if &compatible|set nocompatible|endif

" Set by debian.vim (default for Debian)
"set runtimepath=~/.vim,/var/lib/vim/addons,/usr/share/vim/vimfiles,/usr/share/vim/vim81,/usr/share/vim/vimfiles/after,/var/lib/vim/addons/after,~/.vim/after
" ignore for file name completion (default for Debian)
"set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

" Basic Vim nocompatible setups without mapping
"
if &t_Co == 8 && $TERM !~# '^linux\|^Eterm'  " If t_Co=256, keep it
  set t_Co=16                  " bright colors without forcing bold
endif
colorscheme murphy
filetype plugin indent on
syntax enable
set spell                      " Enable spell check
set spelllang=en_us            " Spell check language as en_us
set autoindent                 " Copy indent from current line
set smartindent                " More than autoindent (Drop/Pop after {/})
set nosmarttab                 " <Tab> always inserts blanks
set backspace=indent,eol,start " Back space through everything
set nowrap                     " Don't wrap line
set complete-=i                " KB completion (disable included files)
set complete-=t                " KB completion (disable searching tags)
set nrformats+=alpha           " Incr/decr. w/alpha by CTRL-A/CTRL-X
set ttimeout                   " Time out on :mappings and key codes
set ttimeoutlen=500            " Time out in ms, 1/2 of default 1000
set viminfo=!,'100,<5000,s100,h " Bigger copy buffer etc. Default '100,<50,s10,h
set sessionoptions-=options    " Effect of :mksession command
set viewoptions-=options       " Effect of :mkview command
set virtualedit=block          " Allow to move cursor beyond for block
set nostartofline              " Keep cursor in the same column
set synmaxcol=500              " Default 3000 --> 500, improves performance
set wildmenu                   " Enhance command-line completion with <Tab>
set scrolloff=1                " At least one extra line around cursor
set sidescrolloff=5            " At least 5 extra columns around cursor
set display+=lastline          " Display truncated as '@@@'
set encoding=utf-8             " No place for 'latin1' in Vim (usually)
"set encoding=iso-2022-jp
"set encoding=euc-jp
"set encoding=sjis
"set encoding=latin1
set fileencodings=utf-8        " No place for 'latin1' for file (usually)
"set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8            " Linux
"set ucs-bom,utf-8,iso-2022-jp,euc-jp,cp932,utf-16le,utf-16,default " Windows
"set ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8 " Windows
set fileformats=unix,dos,mac   " CR/LF convention auto detection order
"set fileformat=unix
set formatoptions+=j           " Delete comment character with 'J'
set tags=./tags,./TAGS,tags,TAGS " default with EMACS tag support
"set shell=/bin/bash            " Always use 'bash' (Debian path)
set shell=bash                 " Always use 'bash' in $PATH
set history=1000               " Default 50 --> 1000
set tabpagemax=50              " Default 10 --> 50
set autoread                   " Read if it detects to be modified
" Disable audible and visual bells
set noerrorbells
set novisualbell
set t_vb=
set laststatus=2               " Always show status line
set noshowmode                 " Insert/Replace or Visual mode put a message on the last line
set ruler                      " Show line and column number
set statusline=%<%t%m%r%h%w%=[%{&ff}]%y\ (%4l/%4L,%3c%V)\ %P
" Maximum Vim native statusline with full path
"set statusline=%<%F%m%r%h%w[U+%04B]%=[%{&ff}]%y\ (%4l/%4L,%3c%V)\ %P
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
set noshowmode                 " Don't show Ins/Repl/Visual (use statusline)
set showcmd                    " Show partial command
set showmatch                  " Show matching bracket
set ttyfast                    " Rendering fast
set hidden                     " open another file without saving
" Alternative -- always write
" set confirm
" set autowriteall
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic precautions (we use bash so $USER is set)
if $USER == "root"
  set noswapfile
endif

" Variable to control plugins
let g:vimrc_level = 2 " all customization
"let g:vimrc_level = 1 " basic customization
"let g:vimrc_level = 0 " no customization

"
" Source pre-configuration (in alphabetical order per directory)
" for vimconf selected plugins
runtime! conf/preconf.enabled/*

" All Vim plugin packages are loaded and processed after this point
" from the subdirectories of ~/.vim/pack/*/start/ etc.
"
" If some special override is needed after loading plugins , place such
" configuration file in ~/.vim/after etc.
"
"
" vim: set sw=2 sts=2 et ft=vim :
