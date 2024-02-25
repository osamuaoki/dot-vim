# sourced at the end of ~/.bashrc
# vim:set et sw=4 sts=4:

#=============================================================================
# GOOD OLDE VI as baseline editor (minimum resource file)
if [ -r ~/.vimrc ]; then
  VIMRC="~/.vimrc"
else
  VIMRC="NONE"
fi
if type nvim >/dev/null ; then
  alias nv='nvim'
  alias vi='nvim -u $VIMRC'
  alias v='nvim -u NORC'
  alias sv="SUDO_EDITOR='/usr/bin/nvim -u NORC' /usr/bin/sudoedit"
elif type vim >/dev/null ; then
  alias vi='vim -N -u $VIMRC'
  alias v='vim -N -u NORC'
  alias sv="SUDO_EDITOR='/usr/bin/vim -N -u NORC' /usr/bin/sudoedit"
else
  unalias vi
  unset VIMRC
fi
if [ -n "$VIMRC" ]; then
  export EDITOR='vi'
  export VISUAL='vi'
  alias vimdiff='vi -d'
  alias view='vi -R'
  alias ex='vi -e'
fi

