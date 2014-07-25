[ -z "$PS1" ] && return

export HISTCONTROL=ignoredups
export LANG="en_US.utf-8"
export LC_ALL="en_US.utf-8"



# Prompt
COLOR_RED="\033[0;31m"
COLOR_YELLOW="\033[0;33m"
COLOR_GREEN="\033[0;32m"
COLOR_OCHRE="\033[38;5;95m"
COLOR_BLUE="\033[0;34m"
COLOR_WHITE="\033[0;37m"
COLOR_RESET="\033[0m"

git_color() {
  local git_status="$(git status 2> /dev/null)"

  if [[ ! $git_status =~ "working directory clean" ]]; then
    echo -e $COLOR_RED
  elif [[ $git_status =~ "Your branch is ahead of" ]]; then
    echo -e $COLOR_YELLOW
  elif [[ $git_status =~ "nothing to commit" ]]; then
    echo -e $COLOR_GREEN
  else
    echo -e $COLOR_OCHRE
  fi
}
git_branch() {
  local git_status="$(git status 2> /dev/null)"
  local on_branch="On branch ([^${IFS}]*)"
  local on_commit="HEAD detached at ([^${IFS}]*)"


  if [[ $git_status =~ $on_branch ]]; then
    local branch=${BASH_REMATCH[1]}
    echo "($branch)"
  elif [[ $git_status =~ $on_commit ]]; then
    local commit=${BASH_REMATCH[1]}
    echo "($commit)"
  fi
}

PS1="\[$COLOR_WHITE\]\n\W "          # basename of pwd
PS1+="\[\$(git_color)\]"        # colors git status
PS1+="\$(git_branch)"           # prints current branch
PS1+="\[$COLOR_WHITE\]\$\[$COLOR_RESET\] "   # '#' for root, else '$'

export PS1

# PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

alias ls='ls -G'
alias ll='ls -al -G'

[[ $TERM == eterm-color ]] && export TERM=xterm

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
# export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# alias
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"


# completion

git_completion='/usr/local/Cellar/git/1.7.3.2/etc/bash_completion.d/git-completion.bash'
if [ -f $git_completion ]; then
  source $git_completion
fi


# method missing
# trap 'if ! type -t $BASH_COMMAND >/dev/null; then ~/.bin/shell-method-missing $BASH_COMMAND; fi' DEBUG




export PATH=~/bin:/usr/local/bin:/opt/local/sbin:$PATH

eval "$(fasd --init auto)"
