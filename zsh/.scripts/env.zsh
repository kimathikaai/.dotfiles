# FYPD Vysio
function mlflow_export(){
    export MLFLOW_TRACKING_URI="http://mlflow.vysio.ca"
    export MLFLOW_TRACKING_USERNAME="admin"
    export MLFLOW_TRACKING_PASSWORD="guhfugpass"
    export GOOGLE_APPLICATION_CREDENTIALS="/home/kimathi/workspace/vysio/classifier/env/vysio-330718-0ceb5e77143e.json"
}

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
# conda activate visio
# conda activate xr-egopose
# conda activate carnd-term1

# CUDA environment variables
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib64
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/include
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/extras/CUPTI/lib64
export PATH=/usr/local/cuda/bin:$PATH

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
