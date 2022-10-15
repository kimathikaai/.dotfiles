#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

. scripts/utils.sh
. scripts/brew.sh
. scripts/packages.sh
. scripts/cli.sh
. scripts/oh-my-zsh.sh
. scripts/config.sh
. scripts/fonts.sh

cleanup() {
  info "Finishing..."
}

wait_input() {
  read -p "Press enter to continue: "
}

trap cleanup EXIT

main() {
  info "Installing ..."

  info "======= Homebrew packages ======="
  wait_input
  install_packages
  warn "Remember $(brew --prefix)/opt/fzf/install"
  success "Finished installing Homebrew packages"

  info "======= Homebrew Fonts ======="
  wait_input
  install_fonts
  success "Finished installing fonts"

  info "======= Oh-my-zsh ======="
  wait_input
  install_oh_my_zsh
  success "Finished installing Oh-my-zsh"

  info "======= NeoVim ======="
  wait_input
  install_neovim
  success "Finished installing neovim"

  info "======= Dotfiles ======="
  wait_input
  stow_dotfiles
  success "Finished stowing dotfiles"

  success "Done"
  info "System needs to restart."
}

main
