""" Initialize Vim
"""
"""  Configure Vim by commenting in/out lines in these files:
"""    * ~/.vim/vimrc                          (this file)
"""    * ~/.vim/after/plugin/override.vim      (parsed last)
"""
""" basic customization
filetype plugin indent on      " filetype aware behavior
syntax enable                  " Syntax highlight
set spelllang=en_us            " Spell check language as en_us
set spell                      " Enable spell check
set autoindent                 " Copy indent from current line
set smartindent                " More than autoindent (Drop/Pop after {/})
set backspace=indent,eol,start " Back space through everything
""" 'statusline' used when airline is inactive
set statusline=%<%f%m%r%h%w%=%y[U+%04B]%2l/%2L=%P,%2c%V
""" more customization
set hidden                     " open another file without saving
set noerrorbells               " Disable audible bells
set novisualbell               " Disable visual bells
set t_vb=                      " Disable visual bells (termcap)
set laststatus=2               " Always show status line
set nowrap                     " Don't wrap line
set nopaste                    " Set-up buffer pasting
set wildmenu                   " Enhance command-line completion with <Tab>
set autoread                   " Read if it detects to be modified
""" TAB key action etc.
"set sw=2 sts=2 ts=2 et         " TAB=2
set sw=4 sts=4 ts=4 et         " TAB=4
"set sw=8 sts=8 ts=8 et         " TAB=8
""" Search
set incsearch                  " Incremental search ON
"set showmatch                  " show match while searching
"set hlsearch                   " highlight searching
""" Searching
"nnoremap / /\v
"vnoremap / /\v
""" Map <C-L> (redraw screen) to also turn off search highlighting until the
""" next search
"nnoremap <C-L> :nohl<CR><C-L>
"set ignorecase                " case insensitive search
""" Display non-printable tabs and newlines
"set smartcase                 " case insensitive search, except when using capital letters
set encoding=utf-8          " encoding within editor
"set encoding=iso-2022-jp   " encoding within editor
"set encoding=euc-jp        " encoding within editor
"set encoding=sjis          " encoding within editor
set fileencodings=          " force to read with fileencoding
""" Auto detect for Windows for file reading
"set fileencodings=ucs-bom,utf-8,iso-2022-jp,euc-jp,cp932,utf-16le,utf-16,default
"set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8
" CR/LF convention auto detection order
"set fileformats=unix,dos,mac
""" performance tunes
set scrolloff=1                " At least one extra line around cursor
set sidescrolloff=5            " At least 5 extra columns around cursor
set display+=lastline          " Display truncated as "@@@"
set formatoptions+=j           " Delete comment character when joining commented lines
set ttimeoutlen=500            " Time out in ms, 1/2 of default 1000
set viminfo=!,'100,<5000,s100,h " Bigger copy buffer etc. Default '100,<50,s10,h
"set number                    " add linenumber
"""
set pastetoggle=<f2>           " Use <F2> for paste mode toggle
" Remap for "Q". "qq" to record MACRO to 'q', "qq" to quit, "Q" to apply
nnoremap Q @q
xnoremap Q :norm @q<cr>
""" Use <SPACE> as leader instead of '\' (set again to make sure)
""" In NORMAL mode, SPACE is useless.  This has to be before <leader> usage.
let mapleader = ' '
" Manual strip whitespace with <leader>s
nnoremap <leader>s :StripWhitespace<cr>
" Remap for smarter command line <c-n>t<c-p>    (vim-galore)
cnoremap <c-n>  <down>
cnoremap <c-p>  <up>
""" Retain cursor position
if has("autocmd")
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif
""" Normally, we don't need this.  Use "ga" to identify Unicode code
"set list             " display non-printable tabs and newlines
"if has('multi_byte') && &encoding ==# 'utf-8'
"  set listchars=eol:¶,tab:⇄\ ,trail:␣,extends:↦,precedes:↤,nbsp:␣
"  "set listchars=eol:↲,tab:⇔\ ,trail:␣,extends:»,precedes:«,nbsp:␣
"  "set listchars=eol:↲,tab:▶\ ,trail:□,extends:▶,precedes:◀,nbsp:□
"else
"  set listchars=tab:>\ ,trail:#,extends:>,precedes:<,nbsp:=
"endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Basic precaution (we use bash so $USER is set)
"
if $USER == "root"
  set noswapfile
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Plugin configuration (enable optional 'runtimepath'.)
"""   - Use ':se rtp' to check 'runtimepath' in NORMAL

" vim: set sw=2 sts=2 et ft=vim :
