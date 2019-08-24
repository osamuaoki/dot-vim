# Customizing Plugins

<!-- vim: set sts=2 sw=2 expandtab ai si et tw=72: -->

For installation, see [README](README.md).

## Customizing Plugins from github repositories


* Add plugin from `https://github.com/<user>/<reponame>`:
  * `vimconf ga https://github.com/<user>/<reponame>`
* Drop plugin from `~/.vim/conf/pack.available/<reponame>`:
  * `vimconf gd <reponame>`
* Update plugins in `~/.vim/conf/pack.available/`:
  * `vimconf gu`
* Reset and clean all configurations and local plugin changes:
  * `vimconf r`

## Interesting plugins

Please check sites such as followings to get popular plugins:

* https://vimawesome.com/
* https://vim-jp.org/tips/start_vimscript.html
* https://qiita.com/reireias/items/beaa3bb0e299ae934217
* https://qiita.com/Sa2Knight/items/6b26d35af571c239da31
* https://medium.com/@huntie/10-essential-vim-plugins-for-2018-39957190b7a9

Also please check the expert set-up examples:

* https://github.com/itchyny/lightline.vim
* https://github.com/itchyny/dotfiles/blob/master/.vimrc
* http://leafcage.hateblo.jp/entry/2013/10/21/lightlinevim-customize

## Binding for plugins

Plugin package specific configuration can be added to
`~/.vim/conf/conf.available/<reponame>`.

* ctrl-p for ctrlp
* ctrl-n for nerdtree




