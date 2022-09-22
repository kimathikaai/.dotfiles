function clc() {
    clockify-cli clone "$(clockify-cli report today | fzf | awk '{print $2}')"
}
alias clin="clockify-cli in -i"
alias clout="clockify-cli out"
alias clr="clockify-cli report today"
alias cl="clockify-cli "
