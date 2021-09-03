""" Initialize Vim
"""
"""  Configure Vim by adjusting values and commenting in/out lines:
"""    * ~/.vim/vimrc                        (this file)
"""    * ~/.vim/gvimrc                       (for gvim, parsed after this)
"""    * ~/.vim/after/plugin/override.vim    (parsed after normal runtimepath)
"""
" Enable airline (1: enable 150ms starup, 0: disable 50ms startup)
let airline_enable=1
""" basic customization
set spelllang=en_us            " Spell check language as en_us
set spell                      " Enable spell check
set smartindent                " More than autoindent (Drop/Pop after {/})
""" 'statusline' used when airline is inactive
set statusline=%<%f%m%r%h%w%=%y[U+%04B]%2l/%2L=%P,%2c%V
""" more customization
set hidden                     " open another file without saving
set noerrorbells               " Disable audible bells
set novisualbell               " Disable visual bells
set t_vb=                      " Disable visual bells (termcap)
set nowrap                     " Don't wrap line
set nopaste                    " Set-up buffer pasting
""" Search
set smartcase    " case insensitive search, except when using capital letters
"set showmatch                  " show match while searching
"set hlsearch                   " highlight searching
""" Display non-printable tabs and newlines
set encoding=utf-8          " encoding within editor
set fileencodings=          " force to read with fileencoding
""" performance tunes
set viminfo=!,'100,<5000,s100,h " Bigger copy buffer etc. Default '100,<50,s10,h
"set number                    " add linenumber
"set list                       " enable list feature (better to be off)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" mini scripts (use vim's native feature)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Use faster 'rg' for :grep
if executable("rg")
  " port https://www.vi-improved.org/recommendations/ to rg
  set grepprg=rg\ --no-heading\ --color=never\ --ignore-case\ --column
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

""" Start netrw if started as 'vim'-only without filename
" Augroup VimStartup:
augroup VimStartup
  au!
  au VimEnter * if expand("%") == "" | e . | endif
augroup END

""" Retain cursor position: $VIMRUNTIME/vimrc_example.vim
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
""" packages from vim: /usr/share/vim/vim??/pack/dist/opt/*
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
packadd! matchit

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" packages from vim-scripts: /usr/share/vim/vimfiles/pack/dist-bundle/opt/*
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if $USER == "root"
  " modeline off for root
  set noswapfile
else
  " safe on any platform
  set nomodeline
  packadd! securemodelines
endif

" Simple but useful
packadd! winmanager
packadd! bufexplorer

" If XML is not detected, ':set ft=xml'
packadd! xmledit

" If XML is not detected, ':set ft=po' ?
packadd! po

packadd! gnupg

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" packages from github: pack/github/opt/*
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

packadd! vim-sensible
""" You may think of `runtime! plugin/sensible.vim` to run here

""" Syntax highlight and spellcheck to work together with dark color: murphy
packadd! vim-spell-under
let g:colors_name = 'murphy'

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

packadd! vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1

"packadd! org-mode
"let g:org_indent = 1

packadd! ale
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


packadd! qlist
""" XXX let g:qlist_enabled = 0 " initially disable this
""" Basic design: replace corresponding native `[I`, `]I`, `[D`, and `]D`
"""
""" NORMAL MODE
nmap <silent> [I <Plug>QlistIncludefromtop
nmap <silent> ]I <Plug>QlistIncludefromhere
nmap <silent> [D <Plug>QlistDefinefromtop
nmap <silent> ]D <Plug>QlistDefinefromhere
"""" VISUAL MODE
xmap <silent> [I <Plug>QlistIncludefromtopvisual
xmap <silent> ]I <Plug>QlistIncludefromherevisual
xmap <silent> [D <Plug>QlistDefinefromtopvisual
xmap <silent> ]D <Plug>QlistDefinefromherevisual

""""  XXX REQUIRED DEBs XXX fzf ripgrep
packadd! fzf
packadd! fzf.vim

""" This avoid crashing fzf menu running in terminal with escape
"""   https://github.com/junegunn/fzf.vim/issues/544
"""   https://vi.stackexchange.com/questions/2614/why-does-this-esc-normal-mode-mapping-affect-startup
"""   https://vi.stackexchange.com/questions/24925/usage-of-timeoutlen-and-ttimeoutlen

fun! RemapTerminalEsc()
  if &ft =~ 'fzf'
    silent! tunmap <buffer> <Esc><Esc>
  else
    " If <Esc> is typed slowly, it can skip this.  (compromise)
    silent! tnoremap <buffer> <Esc><Esc> <c-\><c-n>
  endif
endfun
augroup vimrc
  autocmd!
  autocmd BufEnter * silent! call RemapTerminalEsc()
augroup END

packadd! vim-gitgutter    " for Git
packadd! vim-repeat       " for Repeat with '.'
let g:gitgutter_enabled = 0 " initially disable gitgutter
" hank jump ']c' '[c'

""" For checking UCS/Unicode code point, use 'ga' in NORMAL MODE
if airline_enable
  packadd! vim-airline
  packadd! vim-airline-themes
  "" use hack as GUI terminal font
  if $TERM ==# "linux"
    let g:airline_powerline_fonts = 0
    let g:airline_symbols_ascii = 1
  else
    let g:airline_powerline_fonts = 1
  endif
  " Skip FileType: utf-8[unix]
  let g:airline#parts#ffenc#skip_expected_string = 'utf-8[unix]'
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Key mapping
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap for smarter command line (vim commandline-editing, vim-galore)
" Shell/EMACS style cursor moves for COMMAND MODE
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>
cnoremap <C-D> <Del>
" Shell/EMACS style cursor moves for TERMINAL-JOB MODE
tnoremap <C-F> <Right>
tnoremap <C-B> <Left>
tnoremap <C-D> <Del>

""" Offer original <C-F> to start COMMAND NORMAL HISTORY MODE
""" can be started from CTRL-O
""" (another unused CONTROL character alternative is CTRL-X)
exe "set cedit=\<C-O>"

""" Key Board MACRO with q and Q
""" Remap for "Q". "qq" to record MACRO to 'q', "q" to quit, "Q" to apply
nnoremap Q @q
xnoremap Q :norm @q<cr>

nnoremap <F2> @2
xnoremap <F2> :norm @2<cr>

nnoremap <F3> @3
xnoremap <F3> :norm @3<cr>

""" Use <SPACE> as leader instead of '\' (set again to make sure)
""" In NORMAL mode, SPACE is useless and good to be used for mapleader.
""" Let's use <SPACE> with mostly 2-char combinations to avoid colliding
""" demands.  Frequent commands use repeated key sequences.

let mapleader = ' '

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""" <leader> + 1 char
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""" PASTE MODE toggle
" Use ' p' in NORMAL MODE for paste mode toggle
"set pastetoggle=<f2>           " Use <F2> for paste mode toggle
set pastetoggle=<leader>p

""" Window move (without CTRL-W ... Dangerous for INSERT mode)
nnoremap <leader>h <C-W>h
nnoremap <leader>j <C-W>j
nnoremap <leader>k <C-W>k
nnoremap <leader>l <C-W>l

""" Vim _line indent formatter, (I may change)
nnoremap <leader>=         gg=G

""" Vim folding disabled (Open all folds)
"""  I can't remember all z-things, just a temporary relief
nnoremap <leader>z         zO

"""" Select a word below cursor and set search/replace/highlight (NORMAL)
nnoremap <silent> <leader><leader> yiw:let @/ = '\<' . '<C-R>"' . '\>' <CR>:set hlsearch<CR>

"""" Select highlighted section and set search/replace/highlight (VISUAL)
xnoremap <silent> <leader><leader> y:let @/ = '\V' . escape('<C-R>"', '\')<CR>:set hlsearch<CR>

""" Replace-All template (with manual setting and confirmation)
nnoremap <leader>r :%s%<C-r>/%<C-r>"%gc<Left><Left><Left>

""" Turn-off highlight and refresh screen as usual with <C-L>
" vim-sensible.vim takes care

""" NORMAL -> TERM: open terminal on current window
nnoremap <leader><CR>      :term ++curwin<CR>
""" See FZF above how TERM -> NORMAL is done safely with <Esc>

""" WinManager: toggle _winmanager activity
nnoremap <leader>w         :WMToggle<CR>
"nnoremap <leader>wf         :FirstExplorerWindow<CR>
"nnoremap <leader>wb         :BottomExplorerWindow<CR>

""" BufExplorer
""" To start exploring in the current window
nnoremap <Leader>b         :ToggleBufExplorer<CR>
""" Start exploring in a newly split horizontal window
"nnoremap <Leader>bs         :BufExplorerHorizontalSplit<CR>
""" Start exploring in a newly split vertical window
"nnoremap <Leader>bv         :BufExplorerVerticalSplit<CR>
""" XXX NOT_USEFUL XXX nnoremap <Leader>be         :BufExplorer<CR>
""" Toggle bufexplorer on or off in the current window

" Strip whitespace on EOL (vim-better-whitespace)
nnoremap <leader>e :StripWhitespace<cr>

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""" <leader> + 2 chars
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Rotate spell/syntax mode (default)
"nmap <leader>ss <Plug>RotateSpellSyntax

""" ALE: toggle _ALE activity
nnoremap <leader>aa        :ALEToggle<CR>

""" Git-gutter: toggle G_it activity
nnoremap <leader>gg        :GitGutterToggle<CR>
""" Since other commands are <Leader>h*, I picked <Leader>hh
" preview hunk with <Leader>hp
" move to the preview window, e.g. :wincmd P / <C-W> P
" undo hanks with <Leader>hu
""" Followings seems to be used after 'd' etc)
" ic operates on all lines in the current hunk.
" ac operates on all lines in the current hunk and any trailing empty lines.

""" FZF are somewhat too much but I will keep it just in case I need it.
""" I don't think I can remember all these ...
"""
""" Fzf: CTRL-T:openTAB, CTRL-X:split-H, CTRL-V:split-V
"""      Assign mostly <leader>-f? commands
nnoremap <leader>fb         :Buffers<CR>
nnoremap <leader>fc         :Colors<CR>
nnoremap <leader>ff         :Files<CR>
nnoremap <leader>gl         :GFiles<CR>
nnoremap <leader>gs         :GFiles?<CR>
nnoremap <leader>fm         :Maps<CR>
"""   'ag' is 1 order of magnitude slower
"""   'ug' seems to be about the same speed as 'rg' (SMP aware)
"""   'rg' git aware _--> Install 'ripgrep' and use it
nnoremap <leader>fr         :Rg<CR>
nnoremap <leader>ft         :Tags<CR>
nnoremap <leader>fT         :Filetypes<CR>
nnoremap <leader>fv         :History<CR>
nnoremap <leader>fx         :Commands<CR>
nnoremap <leader>f/         :History/<CR>
nnoremap <leader>f:         :History:<CR>

""" Not so useful (may change)
nnoremap <leader>fh         :Helptags<CR>
nnoremap <leader>fM         :Marks<CR>
nnoremap <leader>fw         :Windows<CR>

""" Doesn't seem to work
"nnoremap <leader>fB         :Btags<CR>

" vim: set sw=2 sts=2 et ft=vim :
