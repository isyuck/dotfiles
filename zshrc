# misc aliases
alias c='clear'
alias q='exit'
alias sdn="sudo shutdown now"
alias wa='wally ~/downloads/*.hex && rm ~/downloads/*.hex'
alias td='task done'
alias vim='nvim'
alias smi='sudo make install'
alias smci='sudo make clean install'

# functions to list a group of files, select a file with fzf,
# then open in $EDITOR
# se - dotfiles edit
se() {du -a ~/.local/bin | awk '{print $2}' | fzf | xargs -r $EDITOR ;} 
# de - dotfiles edit
de() {find $HOME/dotfiles | egrep -v git | fzf | xargs -r $EDITOR ;}

ZSH_THEME="af-modded"
plugins=(
  git
  gitfast
  vi-mode
  alias-finder
  )
source $ZSH/oh-my-zsh.sh

export ZSH="/home/isaac/.oh-my-zsh"
export PATH=/home/isaac/.local/bin:$PATH
export PATH=/home/isaac/.cabal/bin:$PATH
export HISTFILE=~/.config/zsh_history
export EDITOR='nvim'
export FZF_DEFAULT_COMMAND='find .'
export PG_OF_PATH="/home/isaac/code/of_v0.11.0_linux64gcc6_release"

# include hidden files in autocomplete 
setopt globdots

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
