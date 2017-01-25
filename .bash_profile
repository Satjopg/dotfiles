export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export HOMEBREW_BREWFILE=~/.dotfiles/Brewfile

[[ -d ~/.rbenv  ]] && \
  export PATH=${HOME}/.rbenv/bin:${PATH} && \
  eval "$(rbenv init -)"
 
test -r ~/.bashrc && . ~/.bashrc
