# dot-vim

As of 2023-12-24, I use NeoVim (v0.9.5-dev-41+g25bedc925, [osamu's
private deb atgithub](https://osamuaoki.github.io/http/))
with lua based lazyVim (v10.15.1) as my primary editor invoked by
`nvim` (or via its `nv` alias) with
[my customized LazyVim starter](https://github.com/osamuaoki/starter).

This LazyVim environment is nice but a bit heavy.

I decided to use `vi` to start Vim or Nvim with a single file
configuration with very minimal customization.

(I don't use my previous complicated configuration. No more `~/.vim/*`)

## Minimulit features

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

## Setup start

This will set up basic configuration for my vim.

Let me get files and install them.
```
 $ cd path/to
 $ git clone https://github.com/osamuaoki/dot-vim
 $ cp dot-vim/.vim ~/.vim
 $ cp dot-vim/.gvimrc ~/.gvimrc
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

The `~/.vim` and `~/.gvimrc` files in this repo enable me with my
consistent basic `vi` experience for all:

 - `nvim` invoked as `vi`
 - `vim` invoked as `vi` (when `nvim` is missing)
 - `vim` invoked as `vim`
 - `gvim` invoked as `gvim`

I save `nvim` and its shorter alias `nv` for
[my customized LazyVim starter](https://github.com/osamuaoki/starter).

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
