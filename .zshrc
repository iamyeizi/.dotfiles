export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
	zsh-completions
)

source $ZSH/oh-my-zsh.sh
export LANG=en_US.UTF-8

# GENERAL ALIASES
alias la='ls -a'
alias zr='source ~/.zshrc'
alias py='python3'
alias per='cd /Users/yeizi/personal'
alias wk='cd /Users/yeizi/work'
alias fh='cd $(find . -type d -print | fzf --height 50%)'
alias fa='cd $(find ~ -type d -print | fzf --height 50%)'
alias c='code $(find . -type d -print | fzf --height 30%)'
alias f='ranger'
alias gs='git status'
alias cat='bat --paging=never'
alias top='bpytop'
#------------------------

#FUNCTIONAL ALIASES
installed(){
  sdk list $1 | grep installed
}

function git_checkout(){
	if [ $# -eq 0 ]
	then
		git checkout $(git branch | fzf --height 20%)
	else
		git checkout $@
	fi 
};
alias gco="git_checkout"
#------------------------

 . /opt/homebrew/etc/profile.d/z.sh

#PATHS
export PATH="/usr/local/sbin:$PATH"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# pnpm
export PNPM_HOME="/Users/yeizi/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

#fnm node manager
eval "$(fnm env --use-on-cd)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
