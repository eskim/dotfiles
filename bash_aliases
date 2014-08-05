
# alias ls='ls -G'
alias ls='ls -G'
alias ll='ls -la'
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

function gco {
  if [ -z "$1" ]; then
    git checkout master
  else
    git checkout $1
  fi
}

# ruby/rails
alias r='rails'

alias tidy="tidy -raw -q -i --doctype omit --show-body-only true"
