fish_vi_key_bindings

set -gx LC_ALL en_GB.UTF-8
set -x PG_OF_PATH "/Users/iw/src/openFrameworks_v0.11.2"
set -x OF_ROOT "/Users/iw/src/openFrameworks_v0.11.2"

set -x PATH "/Users/iw/.emacs.d/bin:$PATH"
set -x PATH "/Users/iw/.local/bin:$PATH"
set -x PATH "/opt/homebrew/opt/llvm/bin:$PATH"
set -x PATH "/Applications/SuperCollider.app/Contents/MacOS:$PATH"
set -x LDFLAGS -L/opt/homebrew/opt/llvm/lib
set -x CPPFLAGS -I/opt/homebrew/opt/llvm/include
set -x EDITOR vim

set -x P4PORT ssl:ec2-54-241-213-38.us-west-1.compute.amazonaws.com:1666
set -x P4USER isaac

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
alias f2j="faust2jack"

# ghcup-env
set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME
test -f /home/isaac/.ghcup/env; and set -gx PATH $HOME/.cabal/bin /home/isaac/.ghcup/bin $PATH

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME
set -gx PATH $HOME/.cabal/bin /Users/iw/.ghcup/bin $PATH # ghcup-env
