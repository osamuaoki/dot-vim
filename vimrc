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
""" Search
set incsearch                  " Incremental search ON
"set ignorecase                " case insensitive search
set smartcase                  " case insensitive search, except when using capital letters
"set showmatch                  " show match while searching
"set hlsearch                   " highlight searching
""" Searching
"nnoremap / /\v
"vnoremap / /\v
""" Map <C-L> (redraw screen) to also turn off search highlighting until the
""" next search
"nnoremap <C-L> :nohl<CR><C-L>
""" Display non-printable tabs and newlines
set encoding=utf-8          " encoding within editor
set fileencodings=          " force to read with fileencoding
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
""" Use <ESC><ESC> as exit from terminal-job mode: Ctrl-W N (Ctrl-\ Ctrl-N)
"""   This allows me to press 2-<ESC> as a habit even in normal INSERT/REPLACE
"""   modes and to avoid hitting Ctrl-W in normal INSERT/REPLACE modes to
"""   loose data.
tnoremap <Esc><Esc> <C-\><c-n>
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
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Plugin configuration (add optional path to 'runtimepath'.)
"""   - Use ':se rtp' to check 'runtimepath' in NORMAL
"
""" Guard against modeline attack (modeline is off on Debian for user)
""" enable ~/.vim/pack/gitsubmodules/opt/securemodelines
if $USER == "root"
  " modeline off for root
  set noswapfile
else
  " safe on any platform
  set nomodeline
  packadd! securemodelines
endif

""" Syntax highlight and spellcheck to work together with dark color: murphy
""" enable ~/.vim/pack/gitsubmodules/opt/vim-spell-under
packadd! vim-spell-under
let g:colors_name = 'murphy'

""" enable /usr/share/vim/vim??/pack/dist/opt/matchit
packadd! matchit

""" enable /usr/share/vim/vim??/pack/dist/opt/vim-indent-guides
packadd! vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1

""" enable /usr/share/vim/vim??/pack/dist/opt/orgmode
"packadd! org-mode
"let g:org_indent = 1

""" enable /usr/share/vim/vim??/pack/dist/opt/qlist
" packadd! qlist
"
""" Basic design: replace corresponding native `[I`, `]I`, `[D`, and `]D`
"""
""" NORMAL MODE
"nmap <silent> [I <Plug>QlistIncludefromtop
"nmap <silent> ]I <Plug>QlistIncludefromhere
"nmap <silent> [D <Plug>QlistDefinefromtop
"nmap <silent> ]D <Plug>QlistDefinefromhere
""" VISUAL MODE
"xmap <silent> [I <Plug>QlistIncludefromtopvisual
"xmap <silent> ]I <Plug>QlistIncludefromherevisual
"xmap <silent> [D <Plug>QlistDefinefromtopvisual
"xmap <silent> ]D <Plug>QlistDefinefromherevisual

""" enable /usr/share/vim/vim??/pack/dist/opt/vim-airline
""" enable /usr/share/vim/vim??/pack/dist/opt/vim-airline-themes
"""  - for checking UCS/Unicode code point, use 'ga' in NORMAL MODE
packadd! vim-airline
packadd! vim-airline-themes
""" use hack as GUI terminal font
if $TERM ==# "linux"
  let g:airline_powerline_fonts = 0
  let g:airline_symbols_ascii = 1
else
  let g:airline_powerline_fonts = 1
endif
" Skip FileType: utf-8[unix]
let g:airline#parts#ffenc#skip_expected_string = 'utf-8[unix]'
""" enable /usr/share/vim/vim??/pack/dist/opt/vim-better-whitespace
packadd! vim-better-whitespace
" Use better_whitespace display (better than `:set list`)
let g:better_whitespace_enabled=1
" blacklist this plugin for specific file types
" DEFAULT: let g:better_whitespace_filetypes_blacklist=['diff', 'gitcommit', 'unite', 'qf', 'help', 'markdown']
" Almost no blacklist
let g:better_whitespace_filetypes_blacklist=['diff']
" Disable skipping to strip whitespace
let g:strip_max_file_size=0
" Don't auto strip whitespace
let g:strip_whitespace_on_save=0
" Highlight space characters that appear before or in-between tabs
let g:show_spaces_that_precede_tabs=1
" Enable stripping white lines at EOF
let g:strip_whitelines_at_eof=1

""" gnupg in vim-scripts
packadd! gnupg
" vim: set sw=2 sts=2 et ft=vim :
