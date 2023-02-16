# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/yeizi/miniforge3-arm/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/yeizi/miniforge3-arm/etc/profile.d/conda.sh" ]; then
        . "/Users/yeizi/miniforge3-arm/etc/profile.d/conda.sh"
    else
        export PATH="/Users/yeizi/miniforge3-arm/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Create x86 conda environment
#create_x86_env () {
# example usage: create_x86_env myenv_x86 python=3.9
# CONDA_SUBDIR=osx-64 conda create -n $@
# conda activate $1
#}
# Create ARM conda environment
#create_ARM_env () {
# example usage: create_ARM_env myenv_x86 python=3.9
# CONDA_SUBDIR=osx-arm64 conda create -n $@
# conda activate $1
#}