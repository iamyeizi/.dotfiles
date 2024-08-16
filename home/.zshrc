# NO FRESH

export ZSH=$HOME/.oh-my-zsh
ZSH_CUSTOM=$HOME/.config/zsh/custom

ZSH_THEME="robbyrussell"
#ENABLE_CORRECTION="true"

export EDITOR= 'nano'
export DOTFILES=$HOME/.dotfiles
export LANG=en_US.UTF-8
export XDG_CONFIG_HOME=$HOME/.config

source $ZSH/oh-my-zsh.sh

PERSONAL=$XDG_CONFIG_HOME/personal
source $PERSONAL/env
source $PERSONAL/alias

for i in `find -L $PERSONAL`; do
    source $i
done

plugins=(
	git
	zsh-autosuggestions
	zsh-completions
	#zsh-syntax-highlighting
)

bindkey -s ^f "tmux-sessionizer\n"

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
	bindkey -s '^[S' "screen_setup\n"
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"

if [[ "$OSTYPE" == "darwin"* ]]; then
    # pnpm
    export PNPM_HOME="$HOME/Library/pnpm"
    export PATH="$PNPM_HOME:$PATH"
    # pnpm end
fi

if [[ "$OSTYPE" == "darwin"* ]]; then
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
fi

# bun
# completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# fnm
export PATH="$HOME/.local/share/fnm:$PATH"
eval "`fnm env`"

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    export PATH=$HOME/.local/bin:$PATH
fi