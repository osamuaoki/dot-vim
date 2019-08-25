" vim: set sw=2 sts=2 et ft=vim :
" lightline
set noshowmode
set laststatus=2
set showtabline=2
"let g:lightline = {'colorscheme': 'landscape',}
"let g:lightline = {'colorscheme': 'powerline',}
"let g:lightline = {'colorscheme': 'molokai',}
"let g:lightline = {'colorscheme': 'deus',}
"let g:lightline = {'colorscheme': 'jellybeans',}
"let g:lightline = {'colorscheme': '16color',}
"let g:lightline = {'colorscheme': 'wombat',}
"let g:lightline = {'colorscheme': 'PaperColor_dark',}
"let g:lightline = {'colorscheme': 'PaperColor_light',}
"let g:lightline = {'colorscheme': 'darcula',}

let g:lightline = {
  \ 'colorscheme': 'wombat',
  \ 'active': {
  \   'left': [
  \     [ 'mode', 'paste' ],
  \     [ 'charvaluehex'],
  \     ['readonly', 'filename', 'modified' ]
  \   ]
  \ },
  \ 'component': {'charvaluehex': '0x%B'},
  \}

