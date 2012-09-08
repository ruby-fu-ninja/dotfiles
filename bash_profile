[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

alias brake="bundle exec rake"

# MacPorts Installer addition on 2011-03-07_at_19:54:16: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

export CLICOLOR=1;

export EDITOR='vim'

export PS1='\033[0;32m\w \033[1;31m# \033[1;37m';

export GREP_OPTIONS='--color=auto';
export PATH=$HOME/bin:$HOME/local/node/bin:$PATH
export NODE_PATH=$HOME/local/node:$HOME/local/node/lib/node_modules

export AWS_RDS_HOME='/Users/hamish/src/RDSCli-1.6.001';
export JAVA_HOME='/Library/Java/Home';


export PATH=/Users/hamish/src/depot_tools:/opt/local/bin:/opt/local/sbin:$PATH

if [ ! -d /tmp/501 ]; then
echo "Starting ssh-agent" 
mkdir /tmp/501
ssh-agent -a /tmp/501/ssh-agent.socket
fi

SSH_AUTH_SOCK=/tmp/501/ssh-agent.socket
export SSH_AUTH_SOCK
ssh-add ~/.ssh/id_rsa


