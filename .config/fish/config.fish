fish_vi_key_bindings

function fish_mode_prompt
  # NOOP - Disable vim mode indicator
end 

function fish_prompt
        set_color 5f5f87
        echo (pwd | sed "s|^$HOME|~|") '$ ' 
end

alias c='clear'
alias q='exit'
alias la='ls -A'
alias config='/usr/bin/git --git-dir=/home/isaac/.cfg/ --work-tree=/home/isaac'

set -x EDITOR vim
set -U fish_greeting ""
