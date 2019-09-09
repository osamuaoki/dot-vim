" vim: set sw=2 sts=2 et ft=vim :
" Just to be sure (default for Debian)
if &compatible|set nocompatible|endif

" Set by debian.vim (default for Debian)
"set runtimepath=~/.vim,/var/lib/vim/addons,/usr/share/vim/vimfiles,/usr/share/vim/vim81,/usr/share/vim/vimfiles/after,/var/lib/vim/addons/after,~/.vim/after

" more powerful backspacing (default for Debian)
set backspace=indent,eol,start

" keep 50 lines of command line history (default for Debian)
set history=50

" show the cursor position all the time (default for Debian)
set ruler

" ignore for file name completion (default for Debian)
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

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

