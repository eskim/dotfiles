[ -z "$PS1" ] && return

export HISTCONTROL=ignoredups
export LANG="en_US.utf-8"
export LC_ALL="en_US.utf-8"

PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

[[ $TERM == eterm-color ]] && export TERM=xterm


# ec2
if [ -f ~/.bash_ec2 ]; then
    . ~/.bash_ec2
fi

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


#autojump


_autojump() 
{
        local cur
        cur=${COMP_WORDS[*]:1}
        while read i
        do
            COMPREPLY=("${COMPREPLY[@]}" "${i}")
        done  < <(autojump --bash --completion $cur)
}
complete -F _autojump j
data_dir=$([ -e ~/.local/share ] && echo ~/.local/share || echo ~)
export AUTOJUMP_HOME=${HOME}
if [[ "$data_dir" = "${HOME}" ]]
then
    export AUTOJUMP_DATA_DIR=${data_dir}
else
    export AUTOJUMP_DATA_DIR=${data_dir}/autojump
fi
if [ ! -e "${AUTOJUMP_DATA_DIR}" ]
then
    mkdir "${AUTOJUMP_DATA_DIR}"
    mv ~/.autojump_py "${AUTOJUMP_DATA_DIR}/autojump_py" 2>>/dev/null #migration
    mv ~/.autojump_py.bak "${AUTOJUMP_DATA_DIR}/autojump_py.bak" 2>>/dev/null
    mv ~/.autojump_errors "${AUTOJUMP_DATA_DIR}/autojump_errors" 2>>/dev/null
fi

AUTOJUMP='{ [[ "$AUTOJUMP_HOME" == "$HOME" ]] && (autojump -a "$(pwd -P)"&)>/dev/null 2>>${AUTOJUMP_DATA_DIR}/autojump_errors;} 2>/dev/null'
if [[ ! $PROMPT_COMMAND =~ autojump ]]; then
  export PROMPT_COMMAND="${PROMPT_COMMAND:-:} ; $AUTOJUMP"
fi 
alias jumpstat="autojump --stat"
function j { new_path="$(autojump $@)";if [ -n "$new_path" ]; then echo -e "\\033[31m${new_path}\\033[0m"; cd "$new_path";else false; fi }
