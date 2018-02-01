

alias ls='ls -G'
alias ll='ls -al -G'
# alias ls='ls -G'
alias la='ls -A'
alias l='ls -CF'


# git
# from https://github.com/mislav/dotfiles/blob/master/bash_aliases

alias gst0='git status -sb'
alias gst='git status'
alias gl='git pull'
alias gp='git push'
alias gd='git diff'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gb='git branch -v'
alias gpo='git push origin HEAD'
alias gm='git merge --no-ff'
alias gb='git branch'
alias gbb='git branch | peco'
alias gcoo='git checkout $(gbb)'
alias gcob='git checkout -b'

function gco {
  if [ -z "$1" ]; then
    git checkout master
  else
    git checkout $1
  fi
}

# files
alias ff="find * -type f -not -path '*/\.*' | peco"

# ssh

alias sshh='ssh $(cat ~/.ssh/config  | grep "Host " | cut -c6- | peco)'

# ruby/rails
alias r='rails'

alias tidy="tidy -raw -q -i --doctype omit --show-body-only true"


alias psci="psci --single-line-mode"
alias dotenv='env $(cat .env | xargs)'
