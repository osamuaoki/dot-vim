# dot-vim (old)

This is a copy of my old `~/.vim` targeting for vim 8 and later using
the Vim native package management.  I don't use this setting any more.

My current settings can be found at
the ["master" branch here](https://github.com/osamuaoki/dot-vim) and
offer:

* Basic text editor: `vi` with light weight simple settings as
  [presented in the "master" branch here](https://github.com/osamuaoki/dot-vim).
* IDE like text editor: `nvim` with fancy Lua based
  [LazyVim](https://github.com/LazyVim/LazyVim) using its
  [starter settings with my twist](https://github.com/osamuaoki/starter).

So I will not update this "old" branch.  I am keeping this here as my
reference for how I used "`git submodule ...`" and "`:packadd! ...`" to
make elaborate vimL based IDE like settings.

## Key features

* IDE like access to buffer and file selections
* Spellcheck and syntax doesn't interfere each other
* Sure NORMAL mode with `<Esc><Esc>` (terminal)
* Simple search and highlight function with `<SPACE><SPACE>`
* Clean screen (Ale, GitGutter, FZF.VIM capable but hidden)
* Safe window selection moves without using risky CTRL-W
* Shell like CTRL-ASCII access to `<Left>`, `<Right>`, `<DEl>`.
* Minimal key binding overrides
* VIM: Fast 150 ms or 300 ms startup time (without/with airline)
  * NEOVIM: 150 ms either way
* Use baremetal Vim8 feature only (no package manager)
* Symlink `~/.config/nvim -> ../.vim` for Neovim

For inner details on why and how I chose to set up, see:

* [Re-learning Vim (1)](https://osamuaoki.github.io/en/2019/09/17/vim-learn-1/)
* [Re-learning Vim (2)](https://osamuaoki.github.io/en/2019/09/24/vim-learn-2/)

I didn't use `~/.vimrc` since it can't be managed easily with `git`.

## Quick start

This will set up basic configuration for my vim (Others may need to use
their cloned tracking repo if they need to modify and keep by `push`).

```
 $ cd
 $ rm -rf ~/.vim # reset all
 $ git clone https://github.com/osamuaoki/dot-vim ~/.vim
 $ cd ~/.vim
 $ git submodule update --init --recursive
 $ git submodule foreach 'git config submodule.$name.update rebase'
 $ git submodule foreach 'git config pull.rebase true'
 $ git submodule foreach 'git remote set-url --push origin DISABLED_FOR_PUSH'
 $ git submodule foreach 'git checkout master'
 $ git config pull.rebase true
```

This forces to pull always with rebase and stop pushing to someone
else's repo accidentally even if you have write access right.

If you already cloned this repo to `<your_account>`, you may replace
above `git clone` command with:

```
 $ git clone git@github.com:<your_account>/dot-vim.git ~/.vim
```

For select submodule repos I own and wish to push my changes, e.g.,
`vim-spell-under` , I do the following:

```
 $ cd ~/.vim/pack/gitsubmodules/opt/vim-spell-under
 $ git remote set-url --delete --push origin DISABLED_FOR_PUSH

```

or edit `~/.vim/.git/modules/vim-spell-under/config` which may be easier.


Then let's fix all detached HEAD.  (Maybe there is a easier path...)

```
 $ git submodule foreach 'git checkout master'
```

## Adding usable plugin packages

* Add them under `~/.vim/pack/gitsubmodules/opt/` as git-submodule.
  E.g.,

```
 $ git submodule add https://github.com/dense-analysis/ale pack/submodules/opt/ale
```

* Add a line with `packadd!` in `~/.vim/vimrc` to enable it

Vim packages offered as Debian packages usually places package files in
`*/opt/*` path.  So they can be added in the same way in ~/.vim/vimrc`.

##  Last resort

When you broke your Vim start up code, simply rename `~/.vim` to
something else and start Vim.

## Further customization idea

Here are a few insightful recommendations for the best practices I
referenced for setting up Vim.

* [Seven habits of effective text editing](https://www.moolenaar.net/habits.html) by Bram Moolenaar
* [#vim Recommendations](https://www.vi-improved.org/recommendations/)
* [vim-galore](https://github.com/mhinz/vim-galore)

<!-- vim: set sts=2 sw=2 expandtab ai tw=72: -->
