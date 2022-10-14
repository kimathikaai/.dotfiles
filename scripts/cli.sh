install_neovim() {
  info "Installing NeoVim"
  install_brew_formulas neovim

  info "Installing Vim Plugged"
  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

  info "Install plugins and quit"
  nvim +PlugInstall +qall
  nvim +CocInstall coc-pyright +qall
}
