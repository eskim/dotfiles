[ -z "$PS1" ] && return

export HISTCONTROL=ignoredups
export LANG="en_US.utf-8"
export LC_ALL="en_US.utf-8"

PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

[[ $TERM == eterm-color ]] && export TERM=xterm



# alias
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi


# auto jump
if [ -f `brew --prefix`/etc/autojump ]; then
  . `brew --prefix`/etc/autojump
fi

# completion

git_completion='/usr/local/Cellar/git/1.7.3.2/etc/bash_completion.d/git-completion.bash'
if [ -f $git_completion ]; then
  source $git_completion
fi





# method missing
trap 'if ! type -t $BASH_COMMAND >/dev/null; then ~/.bin/shell-method-missing $BASH_COMMAND; fi' DEBUG
