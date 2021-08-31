""" This is sourced after normal plugins
"""
""" Use this for temporary overriding by uncommenting
"""
""" For TAB-indentation override
"set softtabstop=2 shiftwidth=2 tabstop=2 expandtab
"set softtabstop=4 shiftwidth=4 tabstop=4 expandtab
"set softtabstop=8 shiftwidth=8 tabstop=8 expandtab

""" For encoding overrides (Vim internally use utf-8)
"""      'encoding'         default encoding used for file I/O and display
"""      'fileencoding'     convert to 'fileencoding' upon writing to file
"""      'fileencodings'    list of encoding candidates for existing files
"
"set encoding=utf-8         " encoding within editor
"set encoding=iso-2022-jp   " encoding within editor
"set encoding=euc-jp        " encoding within editor
"set encoding=sjis          " encoding within editor
"set fileencodings=         " force to read with fileencoding

""" Auto detect for Windows for file reading
"set fileencodings=ucs-bom,utf-8,iso-2022-jp,euc-jp,cp932,utf-16le,utf-16,default
"set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8
" CR/LF convention auto detection order
"set fileformats=unix,dos,mac

if exists('g:airline_symbols')
" U+E0A3 is missing in hack, so here are the alternatives
"let g:airline_symbols.colnr = '→'
let g:airline_symbols.colnr = ''
endif

""" Keyboard timing
"set timeoutlen=1000             " Mapping delay in ms, default 1000
"set timeoutlen=10000          " TEST: slow Mapping delay in ms
"set ttimeoutlen=10             " Keycode delay in ms, 1/10 of default 100
"set ttimeoutlen=10000         " TEST: slow Keycode delay in ms

""" If vim-better-whitespace is not loaded, enable list
if ! exists('g:loaded_better_whitespace_plugin')
  set list             " display non-printable tabs and newlines
  if has('multi_byte') && &encoding ==# 'utf-8'
    set listchars=eol:¶,tab:⇄\ ,trail:␣,extends:↦,precedes:↤,nbsp:␣
    "set listchars=eol:↲,tab:⇔\ ,trail:␣,extends:»,precedes:«,nbsp:␣
    "set listchars=eol:↲,tab:▶\ ,trail:□,extends:▶,precedes:◀,nbsp:□
  endif
endif
" This must be the last setting. (light enough to run every time now)
"""""""""""""""""" silent! helptags ALL
" filler to avoid the line above being recognized as a modeline
" filler
" filler
" filler
" filler
" vim: set sw=2 sts=2 et ft=vim :
