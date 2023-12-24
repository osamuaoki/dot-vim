" Use Hack font with 14 point for my about 100 DPI 14" monitor
set guifont =Hack\ 14
set lines=60 " Set window height
set columns=98 " Set window width 'co'
" If comparing files side-by-side, then ...
if &diff
  let &columns = (&columns*2)
endif
" Vim is smart enough to adjust lines and columns to the maximum available
" For Hack 14 point:
"     lines=42
"     columns=172
set guioptions+=b " Add bottom scroll bar 'go'
source ~/.vim
