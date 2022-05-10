export ZSH="$HOME/.oh-my-zsh"
export EDITOR='vim'

path+=("$HOME/.emacs.d/bin")
export PATH

plugins=(
    git
    vi-mode
    adb
    copypath
    fzf
    npm
    rust
    stack
    screen
    zsh-autosuggestions
)

zstyle ':omz:update' mode reminder
ZSH_THEME="gentoo"
COMPLETION_WAITING_DOTS="true"

alias q="exit"
alias c="clear"
alias gc="git clone"
alias gs="git status"
alias sr="stack run"
alias sb="stack build"
alias m="make"
alias mr="make run"
alias sdn="shutdown -P now"
alias rm="trash"
alias ll="ls -al"
alias tidy="/opt/homebrew/bin/tidy"
alias vim="nvim"

source $ZSH/oh-my-zsh.sh
