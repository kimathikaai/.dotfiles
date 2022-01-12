# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Define aliases
[ -f ~/.scripts/clockify-cli.zsh ] && source ~/.scripts/clockify-cli.zsh

# Path to your oh-my-zsh installation.
export ZSH="/home/kimathi/.zplug/repos/robbyrussell/oh-my-zsh"

# Check if z-plug is installed or not. If not, install it:
# https://github.com/zplug/zplug
if [[ ! -d ~/.zplug ]]; then
  echo "z-plug not installed. Installing it."
  curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
fi

source ~/.zplug/init.zsh

# pure configuration
fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit
# zsh color palette
zstyle :prompt:pure:path color "#83a598"
zstyle :prompt:pure:prompt:success color "#83a598"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#83a598"
ZSH_AUTOSUGGEST_STRATEGY=(completion history)

prompt pure


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
zplug load

# ZSH themes
# ZSH_THEME="avit"
# source $ZSH/oh-my-zsh.sh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/kimathi/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/kimathi/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/kimathi/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/kimathi/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
conda activate visio

# CUDA environment variables
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib64
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/include
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/extras/CUPTI/lib64

# DO NOT CHANGE
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
