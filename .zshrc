export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="/Users/iw/.opencode/bin:$PATH"
export NVM_DIR="$HOME/.nvm"
[ -s "$(brew --prefix nvm)/nvm.sh" ] && \. "$(brew --prefix nvm)/nvm.sh"

export EDITOR="zed --wait"
export VISUAL="zed --wait"

export ZSH="$HOME/.oh-my-zsh"

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
    conda-zsh-completion
)

zstyle ':omz:update' mode reminder
ZSH_THEME="gentoo"
COMPLETION_WAITING_DOTS="true"

source $ZSH/oh-my-zsh.sh

alias q="exit"
alias c="clear"
alias gc="git clone"
alias gs="git status"
alias m="make"
alias mr="make run"
alias sdn="shutdown -P now"
alias ll="ls -al"
alias tidy="/opt/homebrew/bin/tidy"
alias vim="nvim"

alias lightbg="osascript -e 'tell application \"System Events\" to set picture of every desktop to \"/Users/iw/Pictures/backgrounds/white.png\"'"
alias darkbg="osascript -e 'tell application \"System Events\" to set picture of every desktop to \"/Users/iw/Pictures/backgrounds/black.png\"'"

fpath+=~/.zfunc

autoload -Uz compinit
compinit

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true

. "$HOME/.local/bin/env"

fpath+=~/.zfunc; autoload -Uz compinit; compinit

if [[ -f ~/.zshrc.local ]]; then
    source ~/.zshrc.local
fi
