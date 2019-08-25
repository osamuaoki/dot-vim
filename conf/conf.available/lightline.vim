" vim: set sw=2 sts=2 et ft=vim :
" lightline standard set-ups
set noshowmode
set laststatus=2
set showtabline=2
" custom set-up
" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>     <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
" MODE|PASTE|UNICODE|RO|FILENAME [+]    FFormat|FEncoding|FType|%|LINEINFO
let g:lightline = {
  \ 'colorscheme': 'wombat',
  \ 'active':
  \   {
  \   'left':
  \     [
  \     [ 'mode', 'paste' ],
  \     [ 'charvaluehex'],
  \     [ 'gitbranch', 'readonly', 'filename' ],
  \     ],
  \   'right':
  \     [
  \     [ 'lineinfo' ],
  \     [ 'percent' ],
  \     [ 'fileformat', 'fileencoding', 'filetype' ],
  \     ],
  \   },
  \ 'component': {'charvaluehex': 'U+%04B'},
  \ 'component_function':
  \   {
  \   'gitbranch': 'gitbranch#name',
  \   'readonly': 'LightlineReadonly',
  \   'filename': 'LightlineFilename',
  \   'fileformat': 'LightlineFileformat',
  \   'filetype': 'LightlineFiletype',
  \   'fileencoding': 'LightlineFileencoding',
  \   },
  \ }

" Use full path and Trim the bar before modified sign
function! LightlineFilename()
  "let filename = expand('%:p') !=# '' ? (strchars(expand("%:p")) > winwidth(0) - 40  ? '...' . expand("%:p")[-(winwidth(0) - 40):] : expand("%:p")) : '[No Name]'
  let filename = expand('%:t') !=# '' ? expand("%:t") : '[No Name]'
  let modified = &modified ? ' +' : ''
  return filename . modified
endfunction

" Hide RO if Help
function! LightlineReadonly()
  return &readonly && &filetype !=# 'help' ? 'RO' : ''
endfunction

" Hide FFormat if small window or 'unix'
function! LightlineFileformat()
  return winwidth(0) > 70 && &fileformat !=# 'unix' ? &fileformat : ''
endfunction

" Hide FType if small window
function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

" Hide FEncoding if UTF-8 or small window↲
function! LightlineFileencoding()
  return winwidth(0) > 70 && &fileencoding !=# 'utf-8' ? &fileencoding : ''
endfunction


" ColorScheme alternatives
"'landscape'
"'powerline'
"'molokai'
"'deus'
"'jellybeans'
"'16color'
"'wombat'
"'PaperColor_dark'
"'PaperColor_light'
"'darcula'


