# dot-vim

As of 2023-12-24, I use NeoVim (v0.9.5-dev-41+g25bedc925, local deb)
with lua based lazyNvim (v10.15.1) as my primary editor invoked by
`nvim` (or via its `nv` alias).

This repo now has a copy of my `~/.vim` and `~/.gvimrc` files used for
invoking
 - nvim as vi
 - vim as vi (when nvim is missing)
 - vim as vim
 - gvim as gvim

I don't use my previous complicated configuration. (No more `~/.vim/*`)

## Key features

In order to make minimalist customization, I have removed many
customization tricks mentioned in my old posts.

* [Re-learning Vim (1)](https://osamuaoki.github.io/en/2019/09/17/vim-learn-1/)
* [Re-learning Vim (2)](https://osamuaoki.github.io/en/2019/09/24/vim-learn-2/)

Remaining features are:

* Use bare Vim 8+ and NeoVim 0.8+ features only
* Minimal key binding overrides
* Single file configuration without external package
* Spellcheck and syntax doesn't interfere readability
* Window selection moves with CTRL-{H,J,K,L}

## Quick start

This will set up basic configuration for my vim (Others may need to use
their cloned tracking repo if they need to modify and keep by `push`).

```
 $ cd path/to
 $ git clone https://github.com/osamuaoki/dot-vim
 $ cp dot-vim/.vim ~/.vim
```

I created a local executable `~/bin/vi` (`~/bin` on my PATH):

```sh
#!/bin/sh -e
if [ -e ~/.vim ]; then
  VIRC="~/.vim"
else
  VIRC="NORC"
fi
if type nvim >/dev/null; then
  nvim -u $VIRC "$@"
else
  vim -N -u $VIRC "$@"
fi
```

##  Last resort

When you broke your Vim start up code, try:

- Rename `~/.vim` to `~/.vimx` and `vi -N ~/.vimx`.  Then, rename back to
  `~/.vim`.
- `vim -N -u NORC ~/.vim`
- `nvim -u NORC ~/.vim`

simply rename `~/.vim` to
something else and start Vim or start vim with `vim -N -u NORC`.

## Further customization idea

Here are a few insightful recommendations for the best practices I
referenced for setting up Vim.

* [Seven habits of effective text editing](https://www.moolenaar.net/habits.html) by Bram Moolenaar
* [#vim Recommendations](https://www.vi-improved.org/recommendations/)
* [vim-galore](https://github.com/mhinz/vim-galore)

<!-- vim:set sts=2 sw=2 expandtab ai si tw=72: -->
