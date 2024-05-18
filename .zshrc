# source antidote
source ${ZDOTDIR:-~}/.antidote/antidote.zsh

# initialize plugins statically in ~/.zsh_plugins.txt
antidote load

#####################
# BEN STUFF         #
#####################

# Cargo + Cargo Packages
. "$HOME/.cargo/env"

# Zellij
function start_zellij() {
    if [[ -z "$ZELLIJ" ]]; then
        if [[ "$ZELLIJ_AUTO_ATTACH" == "true" ]]; then
            zellij attach -c main
        else
            zellij
        fi

        if [[ "$ZELLIJ_AUTO_EXIT" == "true" ]]; then
            exit
        fi
    fi
}

export ZELLIJ_AUTO_ATTACH=true
if [[ "$TERM_PROGRAM" == "vscode" ]]; then
    # You are in a VSCode integrated terminal
else
    start_zellij
fi

# Starship
eval "$(starship init zsh)"

# fnm
export PATH="/home/nebrelbug/.local/share/fnm:$PATH"
eval "$(fnm env)"

# zoxide
eval "$(zoxide init zsh)"
