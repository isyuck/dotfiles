# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="/home/isaac/.oh-my-zsh"
export PATH=/home/isaac/.local/bin:$PATH
export PATH=/home/isaac/.cabal/bin:$PATH
export HISTFILE=~/.config/zsh_history
export EDITOR='nvim'
export FZF_DEFAULT_COMMAND='find .'
export PG_OF_PATH="/home/isaac/code/of_v0.11.0_linux64gcc6_release"
export BROWSER="qutebrowser"
# vulkan
export VULKAN_SDK=~/.local/src/vulkan/1.2.148.1/x86_64
export PATH=$VULKAN_SDK/bin:$PATH
export LD_LIBRARY_PATH=$VULKAN_SDK/lib:$LD_LIBRARY_PATH
export VK_LAYER_PATH=$VULKAN_SDK/etc/vulkan/explicit_layer.d

# OFF by default: shell editor wm de palette
export PF_INFO="title os host kernel shell wm de palette"

alias c='clear'
alias q='exit'
alias sdn="sudo shutdown now"
alias wa='wally ~/downloads/*.hex && rm ~/downloads/*.hex'
alias td='task done'
alias vim='nvim'
alias smi='sudo make install'
alias smci='sudo make clean install'
alias bset='brightnessctl set'
alias news='newsboat'
alias dic='sdcv'

# functions to list a group of files, select a file with fzf, then open in $EDITOR
export DOTSDIR="$HOME/dotfiles"
export SCRIPTSDIR="$DOTSDIR/bin"

de() # dotfiles edit
    { find $DOTSDIR -type f \
    | egrep -v 'git|bin' \
    | sed "s#$DOTSDIR##g" \
    | fzf \
    | sed "s#^#$DOTSDIR#" \
    | xargs -r $EDITOR \
}
se() # scripts edit
{
    find $SCRIPTSDIR -type f \
    | sed "s#$SCRIPTSDIR##g" \
    | fzf \
    | sed "s#^#$SCRIPTSDIR#" \
    | xargs -r $EDITOR \
}
ve() # vim edit (recursive in current dir)
    { find . -type f \
    | egrep -v 'git' \
    | fzf \
    | xargs -r $EDITOR \
}

ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(
  git
  gitfast
  vi-mode
  alias-finder
  )

source $ZSH/oh-my-zsh.sh

# include hidden files in autocomplete 
setopt globdots

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
