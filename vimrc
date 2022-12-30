""" Initialize Vim
"""
"""  Configure Vim by adjusting values and commenting in/out lines:
"""    * ~/.vim/vimrc                        (this file)
"""    * ~/.vim/gvimrc                       (for gvim, parsed after this)
"""    * ~/.vim/after/plugin/override.vim    (parsed after normal runtimepath)
"""
" Enable airline (1: enable, 0: disable)
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

""" mini scripts (use vim's native feature)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Use faster 'rg' for :grep
if executable("rg")
  " port https://www.vi-improved.org/recommendations/ to rg
  set grepprg=rg\ --no-heading\ --color=never\ --ignore-case\ --column
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

""" Start netrw file browser by starting (n)vi(m) with
""" "vi ." from shell or ":e ." from vi COMMAND mode.

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
endif

" Simple but useful
"packadd! winmanager
"packadd! bufexplorer

" If XML is not detected, ':set ft=xml'
"packadd! xmledit

" If XML is not detected, ':set ft=po' ?
"packadd! po

"packadd! gnupg

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

packadd! vim-repeat       " for Repeat with '.'

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

""" Window move (without CTRL-W to avoid CTRL-W used in insert mode)
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l

""" Key Board MACRO with q and Q
""" Remap for "Q". "qq" to record MACRO to 'q', "q" to quit, "Q" to apply
nnoremap Q @q

""" Use <SPACE> as leader instead of '\' (set again to make sure)
""" In NORMAL mode, SPACE is useless and good to be used for mapleader.

let mapleader = ' '

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""" <leader> + 1 char
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""" PASTE MODE toggle (needed only for vim. not needed in nvim)
" Use ' p' in NORMAL MODE for paste mode toggle
set pastetoggle=<leader>p

""" NORMAL -> TERM: open terminal on current window
nnoremap <leader><CR>      :term ++curwin<CR>

" Strip whitespace on EOL (vim-better-whitespace)
nnoremap <leader>e :StripWhitespace<cr>

" vim:set sw=2 sts=2 et ft=vim :
