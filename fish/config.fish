fish_vi_key_bindings

set -gx LC_ALL en_GB.UTF-8
# set -x LD_LIBRARY_PATH "/usr/local/cuda/lib64:$LD_LIBRARY_PATH"
# set -x LD_LIBRARY_PATH "/usr/local/lib:$LD_LIBRARY_PATH"
# set -x PATH "/usr/local/cuda/bin:$PATH"
# set -x PATH "/home/isaac/.local/bin:$PATH"
# set -x DOOMDIR "/home/isaac/dotfiles/.doom.d"

set -x PG_OF_PATH "/Users/iw/src/openFrameworks_v0.11.2"
set -x OF_ROOT "/Users/iw/src/openFrameworks_v0.11.2"

set -x PATH "/Users/iw/.emacs.d/bin:$PATH"
set -x PATH "/Users/iw/.local/bin:$PATH"
set -x PATH "/opt/homebrew/opt/llvm/bin:$PATH"
set -x LDFLAGS -L/opt/homebrew/opt/llvm/lib
set -x CPPFLAGS -I/opt/homebrew/opt/llvm/include
set -x PATH "/Applications/SuperCollider.app/Contents/MacOS:$PATH"

set -x P4PORT ssl:ec2-54-241-213-38.us-west-1.compute.amazonaws.com:1666
set -x P4USER isaac

alias q="exit"
alias f2j="faust2jack"
# alias vim="nvim"
alias c="clear"
alias gc="git clone"
alias gs="git status"
alias sr="stack run"
alias sb="stack build"
alias m="make"
alias mr="make run"
alias sdn="shutdown -P now"
alias alsamiser="alsamixer -g -D hw:1"
alias am="alsamixer -g -D hw:1"
alias bat="cat /sys/class/power_supply/BAT1/capacity"
alias td="todoist --color"
alias rm="trash"
alias ll="ls -al"
alias tidy="/opt/homebrew/bin/tidy"

function fish_user_key_bindings
    bind \ett peco_todoist_item
    bind \etp peco_todoist_project
    bind \etl peco_todoist_labels
    bind \etc peco_todoist_close
    bind \etd peco_todoist_delete
end
# ghcup-env
set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME
test -f /home/isaac/.ghcup/env; and set -gx PATH $HOME/.cabal/bin /home/isaac/.ghcup/bin $PATH

# start X at login
if status is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec startx -- -keeptty
    end
end
set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME
#set -gx PATH $HOME/.cabal/bin /Users/iw/.ghcup/bin $PATH # ghcup-env
set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME
set -gx PATH $HOME/.cabal/bin /Users/iw/.ghcup/bin $PATH # ghcup-env
