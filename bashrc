[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

alias brake="bundle exec rake"

# MacPorts Installer addition on 2011-03-07_at_19:54:16: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

export CLICOLOR=1;

export EDITOR='mvim -f'

export PS1='\w # ';