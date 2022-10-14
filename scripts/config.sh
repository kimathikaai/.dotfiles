stow_dotfiles() {
  local files=(
    ".aliases"
    ".gitconfig"
    ".profile.*"
    ".vimrc"
    ".zshrc"
    ".zprofile"
  )
  local folders=(
    ".config/nvim"
    ".ssh"
  )
  info "Removing existing config files"
  for f in "${files[@]}"; do
    rm -f "$HOME/$f" || true
  done

  # Create the folders to avoid symlinking folders
  for d in "${folders[@]}"; do
    rm -rf "${HOME:?}/$d" || true
    mkdir -p "$HOME/$d"
  done

  local dotfiles="git nvim ssh zsh"
  info "Stowing: $dotfiles"
  stow -d stow --verbose 1 --target $HOME $dotfiles
}
