""" Initialize Vim
"""
"""  Configure Vim by adjusting values and commenting in/out lines:
"""    * ~/.vim/vimrc                        (this file)
"""    * ~/.vim/gvimrc                       (for gvim, parsed after this)
"""    * ~/.vim/after/plugin/override.vim    (parsed after normal runtimepath)
"""
""" basic customization
filetype plugin indent on      " filetype aware behavior
syntax enable                  " Syntax highlight
set spelllang=en_us            " Spell check language as en_us
set spell                      " Enable spell check
set autoindent                 " Copy indent from current line
set smartindent                " More than autoindent (Drop/Pop after {/})
set smarttab                    "
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
set smartcase    " case insensitive search, except when using capital letters
"set showmatch                  " show match while searching
"set hlsearch                   " highlight searching
""" Display non-printable tabs and newlines
set encoding=utf-8          " encoding within editor
set fileencodings=          " force to read with fileencoding
""" performance tunes
set scrolloff=1                " At least one extra line around cursor
set sidescrolloff=5            " At least 5 extra columns around cursor
set display+=lastline          " Display truncated as "@@@"
set formatoptions+=j           " Delete comment character when joining commented lines
set timeoutlen=1000             " Mapping delay in ms, default 1000
"set timeoutlen=10000          " TEST: slow Mapping delay in ms
set ttimeoutlen=10             " Keycode delay in ms, 1/10 of default 100
"set ttimeoutlen=10000         " TEST: slow Keycode delay in ms
set viminfo=!,'100,<5000,s100,h " Bigger copy buffer etc. Default '100,<50,s10,h
"set number                    " add linenumber
""" uncomment to use list
"set list             " display non-printable tabs and newlines
""" If list'' is enabled, vim-better-whitespace is not loaded
if has('multi_byte') && &encoding ==# 'utf-8'
  set listchars=eol:¶,tab:⇄\ ,trail:␣,extends:↦,precedes:↤,nbsp:␣
  "set listchars=eol:↲,tab:⇔\ ,trail:␣,extends:»,precedes:«,nbsp:␣
  "set listchars=eol:↲,tab:▶\ ,trail:□,extends:▶,precedes:◀,nbsp:□
else
  set listchars=tab:>\ ,trail:#,extends:>,precedes:<,nbsp:=
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" mini Scripts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Retain cursor position
if has("autocmd")
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line ("'\"") <= line("$") |
        \   exe "normal! g'\"" |
        \ endif
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Plugins ('packadd!' adds optional path to 'runtimepath'.)
"""   - Use ':se rtp' to check 'runtimepath' in NORMAL
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Guard against modeline attack (modeline is off on Debian for user)
""" enable pack/github/opt/securemodelines
if $USER == "root"
  " modeline off for root
  set noswapfile
else
  " safe on any platform
  set nomodeline
  packadd! securemodelines
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Syntax highlight and spellcheck to work together with dark color: murphy
""" enable pack/github/opt/vim-spell-under
packadd! vim-spell-under
let g:colors_name = 'murphy'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" enable pack/github/opt/vim-better-whitespace
if ! &list
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
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" gnupg in vim-scripts
""" enable /usr/share/vim/vimfiles/pack/dist-bundle/opt/gnupg
packadd! gnupg

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" enable /usr/share/vim/vim??/pack/dist/opt/matchit
packadd! matchit

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" enable pack/github/opt/vim-python-matchit
packadd! vim-python-matchit

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" enable pack/github/opt/vim-indent-guides
packadd! vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""" enable pack/github/opt/orgmode
"packadd! org-mode
"let g:org_indent = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""" enable pack/github/opt/ale
packadd! ale
if $ALE =~ '^[Nn]'
  " disable ALE by setting environment $ALE to N*
  let g:ale_enabled = 0 " initially disable ALE.
endif
"let g:ale_enabled = 0 " initially disable ALE.
" ---- if enabled, linters are ON upon writing file
let g:ale_lint_on_text_changed = 'never' " No linters upon change
let g:ale_lint_on_enter = 0 " No linters upon opening a file
let g:ale_lint_on_insert_leave = 0 " No linters upon leaving INSERT
"let g:ale_pattern_options = {'\.min.js$': {'ale_enabled': 0}} " No linters on minified JS
let g:ale_linters = {'python': ['flake8']} " RED (Use this, fast)
"let g:ale_linters = {'python': ['flake8', 'pylint']} "
"let g:ale_linters = {'python': ['pylint']} " YELLOW (MANY)
"let g:ale_linters = {'python': ['mypy']}
""" Think about LSP later (not used now)
"packadd! vim-lsp
"packadd! vim-lsp-ale

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""" enable pack/github/opt/qlist
packadd! qlist
""" XXX let g:qlist_enabled = 0 " initially disable gitgutter
"""" Basic design: replace corresponding native `[I`, `]I`, `[D`, and `]D`
""""
"""" NORMAL MODE
nmap <silent> [I <Plug>QlistIncludefromtop
nmap <silent> ]I <Plug>QlistIncludefromhere
nmap <silent> [D <Plug>QlistDefinefromtop
nmap <silent> ]D <Plug>QlistDefinefromhere
"""" VISUAL MODE
xmap <silent> [I <Plug>QlistIncludefromtopvisual
xmap <silent> ]I <Plug>QlistIncludefromherevisual
xmap <silent> [D <Plug>QlistDefinefromtopvisual
xmap <silent> ]D <Plug>QlistDefinefromherevisual

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""" enable pack/github/opt/fzf
"""" enable pack/github/opt/fzf.vim
""""  install fzf Debian package
packadd! fzf
packadd! fzf.vim

""" This avoid crashing fzf menu running in terminal
"""   https://github.com/junegunn/fzf.vim/issues/544
""" <Esc><Esc> is just in case impatient for slow keycode delay
"""   https://vi.stackexchange.com/questions/2614/why-does-this-esc-normal-mode-mapping-affect-startup
"""   https://vi.stackexchange.com/questions/24925/usage-of-timeoutlen-and-ttimeoutlen
fun! RemapTerminalEsc()
    if &ft =~ 'fzf'
      silent! tunmap <buffer> <Esc>
    else
      tnoremap <buffer> <Esc> <c-\><c-n>
      tnoremap <buffer> <Esc><Esc> <c-\><c-n>
    endif
endfun

augroup vimrc
  autocmd!
  autocmd BufEnter * silent! call RemapTerminalEsc()
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""" enable pack/github/opt/vim-gitgutter (Git)
"""" enable pack/github/opt/vim-repeat    (Repeat .)
packadd! vim-gitgutter
packadd! vim-repeat
let g:gitgutter_enabled = 0 " initially disable gitgutter
" hank jump ']c' '[c'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" enable pack/github/opt/vim-airline
""" enable pack/github/opt/vim-airline-themes
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Key mapping
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap for smarter command line (vim commandline-editting, vim-galore)
" Shell/EMACS style cursor moves for COMMAND MODE
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>
cnoremap <C-D> <Del>
""" No need since this is given
"cnoremap <C-H> <BS>
""" INSERT MODE
" Limited Shell/EMACS style cursor moves for INSERT MODE
inoremap <C-F> <Right>
inoremap <C-B> <Left>
inoremap <C-D> <Del>
""" No need since this is given
"inoremap <C-H> <BS>

""" PASTE MODE toggle
set pastetoggle=<f2>           " Use <F2> for paste mode toggle

""" Key Board MACRO with q and Q
""" Remap for "Q". "qq" to record MACRO to 'q', "qq" to quit, "Q" to apply
nnoremap Q @q
xnoremap Q :norm @q<cr>

""" Use <SPACE> as leader instead of '\' (set again to make sure)
""" In NORMAL mode, SPACE is useless.  This has to be before <leader> usage.
let mapleader = ' '

""" Search always with very magic mode (:h /magic)
"""   This is more ERE(Perl/Python)-like but not quite
" https://vim.fandom.com/wiki/Simplifying_regular_expressions_using_magic_and_no-magic
nnoremap / /\v
xnoremap / /\v
cnoremap %s/ %smagic/
cnoremap \>s/ \>smagic/
nnoremap :g/ :g/\v
nnoremap :g// :g//
""" NORMAL MODE
""" Highlight word below (https://qiita.com/itmammoth/items/312246b4b7688875d023)
nnoremap <silent> <leader><leader> "zyiw:let @/ = '\<' . @z . '\>'<CR>:set hlsearch<CR>
"nnoremap <silent> <leader><leader> :let @/ = '\<' . expand('<cword>') . '\>'<CR>:set hlsearch<CR>
""" Turn-off highlight and refresh screen as usual with <C-L>
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
""" Change all (with confirmation), use <C-r>z to insert original
nmap # <space><space>:%s/<C-r>///gc<Left><Left><Left>
""" VISUAL MODE
""" Highlight word below (https://qiita.com/itmammoth/items/312246b4b7688875d023)
xnoremap <silent> <leader><leader> mz:call <SID>set_vsearch()<CR>:set hlsearch<CR>`z
xnoremap * :<C-u>call <SID>set_vsearch()<CR>/<C-r>/<CR>
xmap # <Space>:%s/<C-r>///gc<Left><Left><Left>
"""
function! s:set_vsearch()
  silent normal gv"zy
  let @/ = '\V' . substitute(escape(@z, '/\'), '\n', '\\n', 'g')
endfunction

""" ??? INSERT MODE swap ch[-2],ch[-1]
inoremap <C-t> <Esc><Left>"zx"zpa

""" no z-register alternative

" Manual strip whitespace with <leader>s (vim-better-whitespace)
nnoremap <leader>s :StripWhitespace<cr>

" TAB
nnoremap <leader>1         1gt<CR>
nnoremap <leader>2         2gt<CR>
nnoremap <leader>3         3gt<CR>
nnoremap <leader>4         4gt<CR>
nnoremap <leader>5         5gt<CR>
nnoremap <leader>6         6gt<CR>
nnoremap <leader>7         7gt<CR>
nnoremap <leader>8         8gt<CR>
nnoremap <leader>9         9gt<CR>

" NORMAL <-> TERM
""" Use space-return to open terminal on current window
nnoremap <leader><CR>      :term ++curwin<CR>

""" ALE: toggle _ALE activity
nnoremap <leader>a         :ALEToggle<CR>

""" Git-gutter: toggle G_it activity
nnoremap <leader>i         :GitGutterToggle<CR>
" preview hunk with <Leader>hp
" move to the preview window, e.g. :wincmd P / <C-W> P
" undo hanks with <Leader>hu
""" Followngs ... I don't know what to do (use after 'd'?)
" ic operates on all lines in the current hunk.
" ac operates on all lines in the current hunk and any trailing empty lines.

""" Fzf: CTRL-T:openTAB, CTRL-X:split-H, CTRL-V:split-V
nnoremap <leader>b         :Buffers<CR>
nnoremap <leader>c         :Colors<CR>
nnoremap <leader>f         :Files<CR>
nnoremap <leader>G         :GFiles<CR>
nnoremap <leader>g         :GFiles?<CR>
nnoremap <leader>m         :Maps<CR>
"""   'ag' is 1 order of magnitude slower
"""   'ug' seems to be about the same speed as 'rg' (SMP aware)
"""   'rg' git aware _--> Install 'ripgrep and use it with <leader>r
nnoremap <leader>r         :Rg<CR>
nnoremap <leader>t         :Tags<CR>
nnoremap <leader>v         :History<CR>
nnoremap <leader>x         :Commands<CR>
nnoremap <leader>/         :History/<CR>
nnoremap <leader>:         :History:<CR>

nnoremap <leader>B         :Btags<CR>
nnoremap <leader>H         :Helptags<CR>
nnoremap <leader>M         :Marks<CR>
nnoremap <leader>T         :Filetypes<CR>
nnoremap <leader>W         :Windows<CR>

nnoremap <leader>w         :wall<CR>

""" Vim _line indent formatter
nnoremap <leader>l         gg=G

""" Vim folding disabled (Open all folds) (I can't remember all z-things)
nnoremap <leader>z         zR

" vim: set sw=2 sts=2 et ft=vim :
