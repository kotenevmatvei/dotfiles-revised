eval "$(starship init zsh)"

bindkey -v

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

alias ls='lsd --group-dirs=first --icon=auto'
alias lsa='lsd -a --group-dirs=first --icon=auto'


function ff {
  aerospace list-windows --all | fzf --bind 'enter:execute(bash -c "aerospace focus --window-id {1}")+abort'
}

# VI Mode!!!
bindkey jj vi-cmd-mode


### FZF ###
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# make brew binaries appear before the preinstalled system binaries
export PATH="/opt/homebrew/bin:$PATH"

export DB_URL=postgresql://postgres:password@localhost/postgres
