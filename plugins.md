# Customizing Plugins

<!-- vim: set sts=2 sw=2 expandtab ai si et tw=72: -->

For installation, see [README](README.md).

## Perspective

Before going wild with plugins, please read the voice of "old guard" vim
gurus (April/2016):

* https://www.vi-improved.org/recommendations/

But that was written in vim 7.4 days.  Vimscript was becoming more like
a real lunguge but we didn't have native support to the asynchronously
excuting background process.  Now spell checker, lint, git
monitoring,... are very useful featurs.

Also, even though its purely a eye candies, colored status line is
something I want it handy.

## Statusline plugin

I tried many and waisted lots of time.

* https://github.com/vim-airline/vim-airline.git
  * Full feature with pre-defined extensions
* https://github.com/rbong/vim-crystalline.git
  * Simple script and good way to learn how script is wriitten
* https://github.com/itchyny/lightline.vim.git
  * Another simple script.

I am using `vim-airline` now since it comes with many pre-made support
scripts as its extension.  It saves me time while it allows very fine
grained tunings.

Others require you to write custome script from scratch and if such
scripts are added, their claimed advantages may not be true any more.

If I need really light statusline, I use bare monochrome static status
line string with vim internally defined items (defined in
`osamuaoki/00-vimrc`).  If vim-airline is active, this setting is
overriden.

## Spelling checks

I normally turn off spelling checks in `osamuaoki/00-vimrc` to avoid
hard to read situation.  Just do `:set spell` / `:set nospell` to
change.

Color optimization may be good idea. ... (TODO)

## Git status checks

I now use:

* https://github.com/tpope/vim-fugitive.git
* https://github.com/airblade/vim-gitgutter

At this moment, My use of `:G....` commands are minimal.  These are used
only as vim-airline clents running in backgrounds for me at this moment.

## Tailing whitespace checks

For tailing whitespace problem, `bronson/vim-trailing-whitespace` is
very nice by coloring all of them in RED.

This is really useful in combination of vim-airline reporting the first
occurance of such tailing whitespace line as warning.

Unlike vim's native feature `listchars` with `list`, this doesn't
interfare with screen copy by mouse etc.

## Lint checks

I now use:

* https://github.com/dense-analysis/ale.git


## Interesting plugins

Please check sites such as followings to get popular plugins:

* https://vimawesome.com/
* https://vim-jp.org/tips/start_vimscript.html
* https://qiita.com/reireias/items/beaa3bb0e299ae934217
* https://qiita.com/Sa2Knight/items/6b26d35af571c239da31
* https://medium.com/@huntie/10-essential-vim-plugins-for-2018-39957190b7a9


## Binding for plugins

Plugin package specific configuration can be added to
`~/.vim/conf/conf.available/<reponame>`.

* ctrl-p for ctrlp
* ctrl-n for nerdtree




