if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -g fish_greeting

set -Ux EDITOR hx
#set -Ux EDITOR "vim"
set -Ux EMAIL "simon@longsleep.org"

set -Ux WASMTIME_HOME "$HOME/.wasmtime"

#starship init fish | source

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# opencode
fish_add_path /home/longsleep/.opencode/bin

# Added by LM Studio CLI (lms)
set -gx PATH $PATH /home/longsleep/.lmstudio/bin
# End of LM Studio CLI section

