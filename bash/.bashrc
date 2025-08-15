#
# ~/.bashrc
#

eval "$(starship init bash)"

export TZ='Europe/Berlin'

# Start ssh-agent if it's not running
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent > ~/.ssh/agent.env
fi

# Source the agent's environment variables
if [ -f ~/.ssh/agent.env ]; then
    . ~/.ssh/agent.env > /dev/null
fi

# Add your default SSH key if no keys are loaded in the agent
# The `ssh-add -l` command will return a non-zero exit code if no identities are loaded.
if ! ssh-add -l &>/dev/null; then
  ssh-add
fi

# add pyenv to the path
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - bash)"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

export DB_URL="postgresql://postgres:password@localhost/postgres"

# flyctl
export FLYCTL_INSTALL="/home/matvei/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"
