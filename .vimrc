""" Generic baseline Vim and Neovim configuration (~/.vimrc)
"""   - For NeoVim, use "nvim -u ~/.vimrc [filename]"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible                " :h 'cp -- sensible (n)vim mode
syntax on                       " :h :syn-on
filetype plugin indent on       " :h :filetype-overview
set encoding=utf-8              " :h 'enc (default: latin1) -- sensible encoding
""" current vim option value can be verified by :set encoding?
set backspace=indent,eol,start  " :h 'bs (default: nobs) -- sensible BS
set statusline=%<%f%m%r%h%w%=%y[U+%04B]%2l/%2L=%P,%2c%V
set listchars=eol:¶,tab:⇄\ ,extends:↦,precedes:↤,nbsp:␣
set viminfo=!,'100,<5000,s100,h " :h 'vi -- bigger copy buffer etc.
""" Pick "colorscheme" from blue darkblue default delek desert elflord evening
""" habamax industry koehler lunaperche morning murphy pablo peachpuff quiet ron
""" shine slate torte zellner
colorscheme industry
"colorscheme default
set scrolloff=5                 " :h 'scr -- show 5 lines around cursor
set laststatus=2                " :h 'ls (default 1)  k
""" boolian options can be unset by prefixing "no"
"set list                        " :h 'list (default nolist)
set smartcase                   " :h 'scs -- Override the 'ignorecase' option
set autoindent                  " :h 'ai
set smartindent                 " :h 'si
set nowrap                      " :h 'wrap
set nolist                      " :h 'list -- (enable when needed)
set noerrorbells                " :h 'eb
set novisualbell                " :h 'vb
set t_vb=                       " :h 't_vb -- termcap visual bell
set spell                       " :h 'spell
set spelllang=en_us,cjk         " :h 'spl -- english spell, ignore CJK
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Popular mappings
""" Window moves without using CTRL-W which is dangerous in INSERT mode
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
""" execute macro recorded with <ESC>qq.....<ESC>q with Q
nnoremap Q @q
""" center after jump next
nnoremap n nzz
nnoremap N Nzz
""" fast "jk" to get out of INSERT mode (<ESC>)
inoremap  jk        <ESC>
""" double <ESC> to get out of TERM mode (CTRL-\ CTRL-N)
tnoremap <ESC><ESC> <C-\><C-N>
""" fast "jkjk" to get out of TERM mode (CTRL-\ CTRL-N)
tnoremap jkjk <C-\><C-N>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" nvim default mappings (no need for nvim)
""" copy to EOL (no delete) like D for d
noremap Y y$
""" "nnoremap <C-L> <Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>
""" disable prefix repeats for erases
inoremap <C-U> <C-G>u<C-U>
inoremap <C-W> <C-G>u<C-W>
""" search visual selected string for visual mode
xnoremap * y/\V<C-R>"<CR>
xnoremap # y?\V<C-R>"<CR>
""" repeat last substitute and *KEEP* flags
nnoremap & :&&<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Force to use underline for spell check results
augroup SpellUnderline
  autocmd!
  autocmd ColorScheme * highlight SpellBad term=Underline gui=Undercurl
  autocmd ColorScheme * highlight SpellCap term=Underline gui=Undercurl
  autocmd ColorScheme * highlight SpellLocal term=Underline gui=Undercurl
  autocmd ColorScheme * highlight SpellRare term=Underline gui=Undercurl
augroup END
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" highlight tailing spaces as red color
highlight RedundantSpaces ctermbg=red guibg=red
call matchadd('RedundantSpaces', '\s\+$')
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Use faster 'rg' (ripgrep package) for :grep
if executable("rg")
  " port https://www.vi-improved.org/recommendations/ to rg
  set grepprg=rg\ --no-heading\ --color=never\ --ignore-case\ --column
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Retain last cursor position :h '"
augroup RetainLastCursorPosition
  autocmd!
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
augroup END
" vim: set sw=2 sts=2 et ft=vim :
