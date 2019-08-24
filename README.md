# dot-vim

<!-- vim: set sts=2 sw=2 expandtab ai si et tw=72: -->

This is a copy of my ~/.vim managed by the `vimconf` script.

This `vimconf` script provides:

* GTK GUI based configuration menu for the `vim` start-up configuration.
* Simple reconfiguration mechanism using symlinks.
* No network access required for the normal reconfiguration.
* Minimal exposures to plugin conflicts.


## Quick start

This will set up basic configuration for your vim.

```
 $ cd
 $ rm -rf ~/.vim # reset all
 $ git clone https://github.com/osamuaoki/dot-vim ~/.vim
 $ ln -sf ../.vim/vimconf bin/vimconf # assume you have ~/bin
 $ cd ~/.vim
 $ vimconf gu
 $ vimconf a
```

If you clone this repo, you may wish to use something like the following
`git clone` command instead to commit changes back to github via ssh.

```
 $ git clone git@github.com:osamuaoki/dot-vim.git ~/.vim
```

## Select vim plugins by `vimconf`

`vimconf` is a GTK GUI plugin selector.

```
$ vimconf h
vimconf: Select Vim Plugins and Configurations
            Version 0.3, © 2019   Osamu Aoki

Usage: vimconf [a|sp|up|so|uo|nm|gu|r|h|ga $URL|gd $REPO]

Actions:
(none) Start with current plugin and override selections.
  a    Select all plugins and Unselect all override.
  sp   Select all plugins.
  up   Unselect all plugins.
  so   Select all overrides.
  uo   Unselect all overrides.
  nm   No menu selection.
  ga   Add a local plugin git repository $URL.
  gd   Drop a local plugin git repository $REPO.
  gu   Update all local plugin git repositories.
  r    Reset all configurations and local plugin changes.
  h    Show this help.

           Latest: https://github.com/osamuaoki/dot-vim
```

## How `vimconf` works

Let's see the content organization of `~/vim/` directory:

```
.
├── after/
│   └── plugin/
│       └── ZZZ_override.vim Hook for conf.enabled/*, override.enabled/*
├── conf/
│   ├── conf.available/
│   │   ├── lightline.vim
│   │   ├── nerdtree
│   │   └── vim-indent-guides
│   ├── conf.enabled/
│   │   ├── lightline.vim -> ../../conf/conf.available/lightline.vim
│   │   └── vim-indent-guides -> ../../conf/conf.available/vim-indent-guides
│   ├── override.available/
│   │   ├── 00-set-wrap
│   │   ├── 02-set-indent-2
│   │   ├── 04-set-indent-4
│   │   ├── 08-set-indent-8
│   │   ├── 10-print-line-number
│   │   ├── 12-print-non-printable
│   │   ├── 20-auto-convert-encode
│   │   ├── 22-search-fancy
│   │   ├── 24-retain-cursor-position
│   │   ├── 30-filetype-all-off
│   │   ├── 32-syntax-off
│   │   └── 34-spell-off
│   ├── override.enabled/
│   │   ├── 12-print-non-printable -> ../../conf/override.available/12-print-non-printable
│   │   └── 22-search-fancy -> ../../conf/override.available/22-search-fancy
│   ├── pack.available/      Local copies of managed plugins
│   │   ├── ack.vim/
│   │   │   └── ...
│   │   ├── ale/
│   │   │   └── ...
│   │   ├── ctrlp.vim/
│   │   │   └── ...
│   │   ├── fzf/
│   │   │   └── ...
│   │   ├── fzf.vim/
│   │   │   └── ...
│   │   ├── lightline.vim/
│   │   │   └── ...
│   │   ├── nerdtree/
│   │   │   └── ...
│   │   ├── vim-gitgutter/
│   │   │   └── ...
│   │   ├── vim-indent-guides/
│   │   │   └── ...
│   │   ├── vim-multiple-cursors/
│   │   │   └── ...
│   │   ├── vim-polyglot/
│   │   │   └── ...
│   │   ├── vim-sensible/
│   │   │   └── ...
│   │   ├── vim-sleuth/
│   │   │   └── ...
│   │   ├── vim-surround/
│   │   │   └── ...
│   │   └── vim-trailing-whitespace/
│   │       └── ...
│   ├── required.system/
│   │   ├── ack.vim
│   │   ├── ale
│   │   ├── fzf
│   │   ├── vim-fugitive
│   │   ├── vim-gitgutter
│   │   └── vim-gutentags
│   └── required.vim/
│       ├── fzf.vim
│       ├── gutentags_plus
│       └── vim-airline-themes
├── pack/
│   ├── persistent/
│   │   └── start/           Local copies of persistent plugins
│   │       └── securemodelines/
│   └── vimconf/
│       └── start/           Directory for symlinks to managed plugins
│           ├── ack.vim -> ../../../conf/pack.available/ack.vim/
│           ├── ale -> ../../../conf/pack.available/ale/
│           ├── ctrlp.vim -> ../../../conf/pack.available/ctrlp.vim/
│           ├── lightline.vim -> ../../../conf/pack.available/lightline.vim/
│           ├── vim-gitgutter -> ../../../conf/pack.available/vim-gitgutter/
│           ├── vim-indent-guides -> ../../../conf/pack.available/vim-indent-guides/
│           ├── vim-multiple-cursors -> ../../../conf/pack.available/vim-multiple-cursors/
│           └── vim-polyglot -> ../../../conf/pack.available/vim-polyglot/
├── plugins.md
├── README.md
├── vimconf*
└── vimrc                         start up code read after debian.vim
```

<!-- * unfool vim formatter -->

Here:

* Copies of upstream packages are stored under
  `~/.vim/conf/pack.available/`.
* A local plugin configuration for each plugin may be provided
  in `~/.vim/conf/conf.available/` with the matched filename.
* Optional local override configuration files are provided
  in `~/.vim/conf/override.available/`.
* Symlinks are managed by the `vimconf` menu program.
*  Sourcing of configuration is in alphabetical order per directory

The exact contents may drift from the above but this should give you
fairly good idea how symlinks are used to enable functionalities.

`vimconf` is smart enough not to step on user temptations.  So you can
temporarily and directly add plugin package under
`~/vim/pack/vimconf/start` and random configuration files under
`~/.vim/conf/conf.enabled` and `~/.vim/conf/override.enabled` to
activate them without getting them managed by `vimconf` as long as names
are chosen not to conflict.

## Further customization of `vimconf`

For more, see [Customizing Plugins](plugins.md).
