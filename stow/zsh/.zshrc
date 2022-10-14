# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# search history
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# Initialize scripts
# To install useful key bindings and fuzzy completion
# $(brew --prefix)/opt/fzf/install
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Check if z-plug is installed or not. If not, install it:
# https://github.com/zplug/zplug
if [[ ! -d ~/.zplug ]]; then
  echo "z-plug not installed. Installing it."
  curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
fi

source ~/.zplug/init.zsh

# List of plugins to load
zplug "plugins/git", from:oh-my-zsh
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load  --verbose

# pure configuration
fpath+=("$(brew --prefix)/share/zsh/site-functions")
autoload -U promptinit; promptinit
prompt pure

# Additional exports
export BAT_THEME="zenburn"
ZSH_AUTOSUGGEST_STRATEGY=(completion history)
export EDITOR="nvim"

# Source all profile files
for file in $HOME/.profile*; do
  source "$file"
done

# Source aliases
[ -f ~/.aliases ] && source ~/.aliases
