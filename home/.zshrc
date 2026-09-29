export LANG=en_US.UTF-8
export EDITOR=nvim
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export DOTFILES="${DOTFILES:-${${(%):-%N}:A:h:h}}"
export ZSH="${ZSH:-$HOME/.oh-my-zsh}"
export ZSH_CUSTOM="$XDG_CONFIG_HOME/zsh/custom"
export ZSH_THEME="robbyrussell"

if [[ $OSTYPE == linux* ]]; then
    for brew_candidate in /home/linuxbrew/.linuxbrew/bin/brew "$HOME/.linuxbrew/bin/brew"; do
        if [[ -x $brew_candidate ]]; then
            eval "$("$brew_candidate" shellenv)"
            break
        fi
    done
    unset brew_candidate
fi

plugins=(git pipenv zsh-autosuggestions zsh-completions)

if [[ -d $HOME/.docker/completions ]]; then
    fpath=($HOME/.docker/completions $fpath)
fi

if [[ -f $ZSH/oh-my-zsh.sh ]]; then
    source "$ZSH/oh-my-zsh.sh"
else
    autoload -Uz compinit && compinit
fi

# Custom PROMPT
PROMPT="%(?:%{$fg_bold[white]%}:%{$fg_bold[red]%})%{$fg[blue]%}%n@%m:%{$fg[white]%}%c%{$reset_color%}$ "
PROMPT+='$(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%})"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

# TEMPORAL
wtp() {
  local host="$1"
  local port="$2"
  local interval="${3:-1}"
  watch -d -n"$interval" "tp $host $port"
}

PERSONAL=$XDG_CONFIG_HOME/personal
for personal_file in env alias paths; do
    [[ -f $PERSONAL/$personal_file ]] && source "$PERSONAL/$personal_file"
done
[[ -f $PERSONAL/local.zsh ]] && source "$PERSONAL/local.zsh"

bindkey -s ^f "tmux-sessionizer\n"

export BUN_INSTALL="$HOME/.bun"
[[ -s $HOME/.bun/_bun ]] && source "$HOME/.bun/_bun"
[[ -f $HOME/.iterm2_shell_integration.zsh ]] && source "$HOME/.iterm2_shell_integration.zsh"
typeset -U path PATH
