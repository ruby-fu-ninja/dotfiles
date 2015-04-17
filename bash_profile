[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

alias brake="bundle exec rake"

export CLICOLOR=1;

export EDITOR='vim'

export PS1='\033[0;32m\w \033[1;31m# \033[1;37m';

export GREP_OPTIONS='--color=auto';

if [ ! -d /tmp/501 ]; then
echo "Starting ssh-agent" 
mkdir /tmp/501
ssh-agent -a /tmp/501/ssh-agent.socket
fi

SSH_AUTH_SOCK=/tmp/501/ssh-agent.socket
export SSH_AUTH_SOCK
ssh-add ~/.ssh/id_rsa
