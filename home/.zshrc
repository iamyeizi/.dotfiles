# NO FRESH

export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"
#ENABLE_CORRECTION="true"

export EDITOR= 'nano'
export DOTFILES=$HOME/.dotfiles
export LANG=en_US.UTF-8
export XDG_CONFIG_HOME=$HOME/.config

PERSONAL=$XDG_CONFIG_HOME/personal
source $PERSONAL/env
for i in `find -L $PERSONAL`; do
    source $i
done

plugins=(
	git
	zsh-autosuggestions
	#zsh-syntax-highlighting
	zsh-completions
)

source $ZSH/oh-my-zsh.sh

# Where should I put you?
bindkey -s ^f "tmux-sessionizer\n"

 . /opt/homebrew/etc/profile.d/z.sh
. $HOME/z/z.sh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/y/.sdkman"
[[ -s "/Users/y/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/y/.sdkman/bin/sdkman-init.sh"

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
