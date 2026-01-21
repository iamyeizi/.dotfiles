export LANG=en_US.UTF-8
export EDITOR=nvim
export XDG_CONFIG_HOME=$HOME/.config
export DOTFILES=$HOME/.dotfiles
export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM=$XDG_CONFIG_HOME/zsh/custom
export ZSH_THEME="robbyrussell"

source $ZSH/oh-my-zsh.sh

# Custom PROMPT
PROMPT="%(?:%{$fg_bold[white]%}:%{$fg_bold[red]%})%{$fg[blue]%}%n@%m:%{$fg[white]%}%c%{$reset_color%}$ "
PROMPT+='$(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%})"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

PERSONAL=$XDG_CONFIG_HOME/personal
source $PERSONAL/env
source $PERSONAL/alias
source $PERSONAL/paths

plugins=(
	git
    pipenv
	zsh-autosuggestions
	zsh-completions
)

bindkey -s ^f "tmux-sessionizer\n"

if [[ "$OSTYPE" == "darwin"* ]]; then
    test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
fi

# bun completions
[ -s "/Users/y/.bun/_bun" ] && source "/Users/y/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# opencode
export PATH=/Users/y/.opencode/bin:$PATH
