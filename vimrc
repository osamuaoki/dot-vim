""" Initialize Vim
"""
"""  Configure Vim by adjusting values and commenting in/out lines:
"""    * ~/.vim/vimrc                        (this file)
"""    * ~/.vim/gvimrc                       (for gvim, parsed after this)
"""    * ~/.vim/after/plugin/override.vim    (parsed after normal runtimepath)
"""
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
""" enable pack/github/opt/vim-sensible
packadd! vim-sensible
""" matchit is loaded by putting on the RTP
""" You may think of `runtime! plugin/sensible.vim`
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
""" INSERT MODE swap ch[-2],ch[-1]
inoremap <C-t> <Esc><Left>"zx"zpa

""" PASTE MODE toggle
set pastetoggle=<f2>           " Use <F2> for paste mode toggle

""" Key Board MACRO with q and Q
""" Remap for "Q". "qq" to record MACRO to 'q', "qq" to quit, "Q" to apply
nnoremap Q @q
xnoremap Q :norm @q<cr>

""" Use <SPACE> as leader instead of '\' (set again to make sure)
""" In NORMAL mode, SPACE is useless.  This has to be before <leader> usage.
let mapleader = ' '

nnoremap <leader>w          :wall<CR>

""" Vim _line indent formatter
nnoremap <leader>=         gg=G

""" Vim folding disabled (Open all folds) (I can't remember all z-things)
nnoremap <leader>z         zR

""" # and * are interesting but it just moves only

""" Highlight all where # and * takes to (NORMAL)
nnoremap <silent> <leader><leader> "zyiw:let @/ = '\<' . @z . '\>' <CR>:set hlsearch<CR>
""" Change all (with confirmation)

function! s:set_vsearch()
  " reselect the previous Visual area and put it into z-register
  silent normal gv"zy
  " escape backslash and NL put it into search pattern
  let @/ = '\V' . substitute(escape(@z, '/\'), '\n', '\\n', 'g')
endfunction

""" Highlight all VISUAL selected exact string
xnoremap <silent> <leader><leader> mz:call <SID>set_vsearch()<CR>:set hlsearch<CR>`z

""" Change all (with confirmation) @z @/ used
nnoremap <leader>s :%s/<C-r>//<C-r>z/gc<Left><Left><Left>
""" # and * like action can be done by / and ?

""" Turn-off highlight and refresh screen as usual with <C-L>
" vim-sensible.vim takes care

" Manual strip/delete whitespace with <leader>d (vim-better-whitespace)
nnoremap <leader>d :StripWhitespace<cr>

""" NORMAL -> TERM: open terminal on current window
nnoremap <leader><CR>      :term ++curwin<CR>
""" See FZF above how TERM -> NORMAL: exit TERMINAL with <Esc>

""" ALE: toggle _ALE activity
nnoremap <leader>a        :ALEToggle<CR>

""" Git-gutter: toggle G_it activity
nnoremap <leader>gg        :GitGutterToggle<CR>
""" Since other commands are <Leader>h*, I picked <Leader>hh
" preview hunk with <Leader>hp
" move to the preview window, e.g. :wincmd P / <C-W> P
" undo hanks with <Leader>hu
""" Followngs ... I don't know what to do (use after 'd'?)
" ic operates on all lines in the current hunk.
" ac operates on all lines in the current hunk and any trailing empty lines.

""" Fzf: CTRL-T:openTAB, CTRL-X:split-H, CTRL-V:split-V
"
"""   Already used <leader> commands: a gg s d w z = <Space> <Cr>
"                           not used: eijklnopquy
nnoremap <leader>b         :Buffers<CR>
nnoremap <leader>c         :Colors<CR>
nnoremap <leader>f         :Files<CR>
nnoremap <leader>gl        :GFiles<CR>
nnoremap <leader>gs        :GFiles?<CR>
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

""" Not so useful (may change)
nnoremap <leader>ht         :Helptags<CR>
nnoremap <leader>mr         :Marks<CR>
nnoremap <leader>wn         :Windows<CR>

""" Doesn't seem to work
"nnoremap <leader>B         :Btags<CR>
"nnoremap <leader>T         :Filetypes<CR>

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

" vim: set sw=2 sts=2 et ft=vim :
