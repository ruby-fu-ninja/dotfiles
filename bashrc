. ~/bin/bash_colors.sh
source ~/bin/git-completion.bash

# rbenv
#export PATH="$HOME/.rbenv/bin:$PATH" 
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
# rbenv


# Add ~/bin to $PATH
export PATH="~/bin:$PATH"

alias brake="bundle exec rake"
alias gpo="git push origin"

export CLICOLOR=1;
export TERM=xterm-256color;

export EDITOR='vim'

export PS1='\\[\033[0;32m\w \033[1;31m# \033[1;37m';
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export GREP_OPTIONS='--color=auto';

# Erase duplicates in history
export HISTCONTROL=erasedups
# Store 10k history entries
export HISTSIZE=10000
# Append to the history file when exiting instead of overwriting it
shopt -s histappend

function latest_tag {
  echo 'Fetching tags...'
  git fetch --tags
  TAG=(`git tag | sort -t. -k 1,1n -k 2,2n -k 3,3n`)
  echo "Lastest tag is ${TAG[@]:(-1)}"
}

function minutes_since_last_commit {
  now=`date +%s`
  last_commit=`git log --pretty=format:'%at' -1`
  seconds_since_last_commit=$((now-last_commit))
  minutes_since_last_commit=$((seconds_since_last_commit/60))
  echo $minutes_since_last_commit
}

grb_git_prompt() {
  local g="$(__gitdir)"
  if [ -n "$g" ]; then
    local MINUTES_SINCE_LAST_COMMIT=`minutes_since_last_commit`
    if [ "$MINUTES_SINCE_LAST_COMMIT" -gt 30 ]; then
      local COLOR=${RED}
    elif [ "$MINUTES_SINCE_LAST_COMMIT" -gt 10 ]; then
      local COLOR=${YELLOW}
    else
      local COLOR=${GREEN}
    fi
    local SINCE_LAST_COMMIT="${COLOR}$(minutes_since_last_commit)m${NORMAL}"
    # The __git_ps1 function inserts the current git branch where %s is
    local GIT_PROMPT=`__git_ps1 "(%s|${SINCE_LAST_COMMIT})"`
    echo ${GIT_PROMPT}
    fi
}
PS1="\h:\W\$(grb_git_prompt) \u\$ "

if [ ! -d /tmp/501 ]; then
echo "Starting ssh-agent" 
mkdir /tmp/501
ssh-agent -a /tmp/501/ssh-agent.socket
fi

SSH_AUTH_SOCK=/tmp/501/ssh-agent.socket
export SSH_AUTH_SOCK
ssh-add ~/.ssh/id_rsa

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
source ~/.profile
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # rvm

complete -C aws_completer aws
