
alias ls='ls -G'
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'


# git
# from https://github.com/mislav/dotfiles/blob/master/bash_aliases

alias gst='git status -sb'
alias gl='git pull'
alias gp='git push'
alias gd='git diff'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gb='git branch -v'

function gco {
  if [ -z "$1" ]; then
    git checkout master
  else
    git checkout $1
  fi
}

# ruby/rails
alias r='rails'
