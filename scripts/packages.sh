taps=(
  homebrew/core
  homebrew/cask
  homebrew/cask-fonts
)

packages=(
	bat                 #  https://github.com/sharkdp/bat
	cmake
	zsh			        #  https://sourabhbajaj.com/mac-setup/iTerm/zsh.html
	zplug			    #  https://github.com/zplug/zplug
	fzf			        #  https://github.com/junegunn/fzf
    ffmpeg
	git
	neovim 			    #  https://neovim.io/
	isort			    #  https://pycqa.github.io/isort/
	black			    #  https://black.readthedocs.io/en/stable/
	curl			    #  https://curl.se/
	pure			    #  https://github.com/sindresorhus/pure
	node			    #  https://nodejs.org/en/
	gnupg			    #  https://gnupg.org/
	stow			    #  https://www.gnu.org/software/stow/
	python3			    #  https://docs.python-guide.org/starting/install3/osx/
	python@3.8
    the_silver_searcher #  https://github.com/ggreer/the_silver_searcher
    exa                 #  https://github.com/ogham/exa
    jq                  #  https://stedolan.github.io/jq/
    lucassabreu/tap/clockify-cli    #  https://github.com/lucassabreu/clockify-cli
    tmux
    ripgrep
    htop
)

casks=(
    iterm2
)

install_packages() {
  info "Configuring taps"
  apply_brew_taps "${taps[@]}"

  info "Installing packages..."
  install_brew_formulas "${packages[@]}"
  
  info "Installing casks..."
  install_brew_formulas "${casks[@]}"

  info "Cleaning up brew packages..."
  brew cleanup
}
