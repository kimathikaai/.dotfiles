fzf_conda_environments(){
    conda activate "$(conda info --envs | fzf | awk '{print $1}')"
}

alias env="fzf_conda_environments"
