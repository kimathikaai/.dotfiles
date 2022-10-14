install_oh_my_zsh() {
  if [[ ! -d ~/.oh-my-zsh ]]; then
    info "Installing oh my zsh..."
    ZSH=~/.oh-my-zsh sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    
  else
    warn "oh-my-zsh already installed"
  fi
}
