# dot-vim

My current settings here offer:

* Basic text editor: `vim` with light weight simple settings as
  [presented in the "master" branch here as .vimrc](https://github.com/osamuaoki/dot-vim/blob/master/.vimrc).
* IDE like text editor: `nvim` with fancy Lua based
  [LazyVim](https://github.com/LazyVim/LazyVim) using its
  [starter settings with my minimalist twist](https://github.com/osamuaoki/starter).

No more "`git submodule ...`" nor "`:packadd! ...`", here.

If you are looking of my old page on them, please see ["old" branch
here](https://github.com/osamuaoki/dot-vim/tree/old).  This was fancy
IDE-like setting with static code analysis with Vim8.

## My 2 text-ediror environments

I know it is tempting to have many fancy features and use newer
versions.  But this makes me exposed to bugs.  I want stable work
environment.

In order to satisfy these 2 conflicting needs, I set up 2 primary
editor environments as below:

* Install Vim from Debian repo
* Install Nvim from my private deb-package at [https://osamuaoki.github.io/http/](https://osamuaoki.github.io/http/).
* Run followings:

```console
 $ apt update && apt install vim
 $ cd path/to
 $ git clone https://github.com/osamuaoki/dot-vim
 $ cp dot-vim/.vimrc ~/.vimrc
 $ cp dot-vim/.gvimrc ~/.gvimrc
 $ cat dot-vim/70_editor.sh >>~/.bashrc
 $ mkdir -p ~/.config && cd ~/.config/nvim
 $ git clone https://github.com/LazyVim/starter ~/.config/nvim
```

With these:

* `vim`: Simple reasonable setup with `-u ~/.vimrc` with Vim
* `nvim`: LazyVim setup with Nvim with my minimalist twist

(I don't use my previous complicated configuration. No more `~/.vim/*`)

More elaborate explanations are available at:

* [Building Neovim](https://osamuaoki.github.io/en/2023/03/05/nvim-build/)
* [Re-learning Vim (7)](https://osamuaoki.github.io/en/2023/03/05/vim-learn-7/)
* [Re-learning Vim (8)](https://osamuaoki.github.io/en/2024/06/04/vim-learn-8/)

## Minimalist features

In order to make minimalist customization in my `~/.vimrc`, I have removed many
customization tricks mentioned in my old posts.

* [Re-learning Vim (1)](https://osamuaoki.github.io/en/2019/09/17/vim-learn-1/)
* [Re-learning Vim (2)](https://osamuaoki.github.io/en/2019/09/24/vim-learn-2/)

Remaining features are:

* Use bare Vim 8+ and NeoVim 0.8+ features only
* Minimal key binding overrides (mostly emulating LazyVim)
* Single file configuration without external package
* Spellcheck and syntax doesn't interfere readability
* Window selection moves with CTRL-{H,J,K,L}
* Cursor after search at the center of screen

I also made modifications to the
[upstream LazyVim starter code repo]( https://github.com/LazyVim/starter)
and keep it at
[my customized minimalist LazyVim starter code repo](https://github.com/osamuaoki/starter).

## Last resort

When I break my Vim start up code, I can always use `vi -N -u NORC`.

## Further customization idea

Here are a few insightful recommendations for the best practices I
referenced for setting up Vim.

* [Seven habits of effective text editing](https://www.moolenaar.net/habits.html) by Bram Moolenaar
* [vim-galore](https://github.com/mhinz/vim-galore)
* ~~[#vim Recommendations](https://www.vi-improved.org/recommendations/)~~ No more accessible

<!-- vim:set sts=2 sw=2 expandtab ai si tw=72: -->
