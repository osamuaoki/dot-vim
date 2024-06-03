# sourced at the end of ~/.bashrc
# vim:set sw=2 sts=2 ai si et:
# Use: shfmt -s -w
#=============================================================================
if [ -r "$HOME/.vimrc" ]; then
  VIMRC="$HOME/.vimrc"
else
  VIMRC="NORC"
fi
if type /usr/bin/nvim > /dev/null; then
  export EDITOR="/usr/bin/nvim"
  # Set NVIM_APPNAME for nvim
  # Nvim playground
  NVIM_APPNAME=nvim # normal nvim -- currently osamu's LazyVim
  #NVIM_APPNAME=nvim0 # default LazyVim
  #NVIM_APPNAME=nvim1 # osamu's LazyVim (backup)
  #NVIM_APPNAME=nvim2 # ...
  export NVIM_APPNAME
  alias v="/usr/bin/nvim"
  alias vi="/usr/bin/nvim"
  alias v0="/usr/bin/nvim -u NORC"
  alias v1='/usr/bin/nvim -u $VIMRC'
  alias sv="env SUDO_EDITOR='/usr/bin/nvim -u NORC' /usr/bin/sudoedit"
  alias vimdiff='/usr/bin/nvim -d -u $VIMRC'
  alias view="/usr/bin/nvim -R -u NORC"
  alias ex="/usr/bin/nvim -e -u NORC"
elif type vim > /dev/null; then
  export EDITOR='vim'
  alias v='vim -N -u $VIMRC'
  alias vi='vim -N -u $VIMRC'
  alias v0="vim -N -u NORC"
  alias v1='vim -N -u $VIMRC'
  alias sv="env SUDO_EDITOR='/usr/bin/vim -N -u NORC' /usr/bin/sudoedit"
else
  unset VIMRC
fi
export VISUAL=$EDITOR

alias nvim0="env NVIM_APPNAME=nvim0 /usr/bin/nvim" # upstream default
alias nvim1="env NVIM_APPNAME=nvim1 /usr/bin/nvim" # osamu default
alias nvim2="env NVIM_APPNAME=nvim2 /usr/bin/nvim" # ...
alias nvim3="env NVIM_APPNAME=nvim3 /usr/bin/nvim"
alias nvim4="env NVIM_APPNAME=nvim4 /usr/bin/nvim"
alias nvim5="env NVIM_APPNAME=nvim5 /usr/bin/nvim"
alias nvim6="env NVIM_APPNAME=nvim6 /usr/bin/nvim"
alias nvim7="env NVIM_APPNAME=nvim7 /usr/bin/nvim"
alias norg="env NVIM_APPNAME=nvimnorg /usr/bin/nvim"
alias nrock="env NVIM_APPNAME=nvimrocks /usr/bin/nvim"

