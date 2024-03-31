export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"
#ENABLE_CORRECTION="true"
export EDITOR= 'nano'
export DOTFILES=$HOME/.dotfiles

plugins=(
	git
	zsh-autosuggestions
	#zsh-syntax-highlighting
	zsh-completions
)

source $ZSH/oh-my-zsh.sh
export LANG=en_US.UTF-8

# Where should I put you?
bindkey -s ^f "tmux-sessionizer\n"

# GENERAL ALIASES
alias ta='tmux attach'
alias nvm='fnm'
alias la='ls -AF'
alias l='ls -AlF'
alias zr='source $HOME/.zshrc'
alias py='python3'
alias d='cd $HOME/d'
alias wk='cd $HOME/work'
alias fh='cd $(find . -type d -not -path "*node_modules*" -print | fzf --height 50%)'
alias fa='cd $(find $HOME -type d -not -path "*node_modules*" -print | fzf --height 50%)'
alias c='code $(find . -type d -not -path "*node_modules*" -print | fzf --height 30%)'
alias nvf='nvim $(find . -type f -not -path "*node_modules*" -follow -print | fzf --height 30%)'
alias nvd='nvim $(find . -type d -not -path "*node_modules*" -print | fzf --height 30%)'
alias r='ranger'
alias gs='git status'
alias top='htop'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias openpd="cd $HOME/Documents/Crack_Parallels && sudo ./Launch_Parallels.command"
alias gck="git_checkout"
alias up="brew upgrade && bun upgrade && omz update"
alias obs="cd /Users/y/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/iamyeizi"
alias lr='l | rg'
alias wf='wifi-password'
#------------------------

#FUNCTIONAL ALIASES

commitDotFiles() {
    pushd $DOTFILES
    git add .
    git commit -m "automatic commit"
    git push origin main
    popd
}

alias cdot='commitDotFiles'

t(){
	tree -a -L $1
}

installed(){
	sdk list $1 | grep -e installed -e local
}

function gitCheckout(){
	if [ $# -eq 0 ]
	then
		git checkout $(git branch | fzf --height 20%)
	else
		git checkout $@
	fi
};

alias gco="gitCheckout"

#------------------------

 . /opt/homebrew/etc/profile.d/z.sh

#PATHS
export PATH="$DOTFILES/tmux:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/personal/py-tools:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/bin:$PATH"
export PATH="/sbin:$PATH"
export PATH="/usr/sbin:$PATH"
export PATH="/usr/bin:$PATH"
export PATH="/opt/homebrew:$PATH"
export PATH="$HOME/.local/bin:$PATH"


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
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

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

