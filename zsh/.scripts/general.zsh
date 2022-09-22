function dnmcli() {
    nmcli connection down "$(nmcli connection show | fzf | awk '{print $(NF-2)}')"
}
function anmcli() {
    nmcli connection up "$(nmcli connection show | fzf | awk '{print $(NF-2)}')"
}

alias open="xdg-open"
alias v="nvim"
