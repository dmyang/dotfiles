#/bin/bash

export EDITOR='vim -f'
export HISTCONTROL=ignoredups
export HISTIGNORE="&:ls:[bf]g:exit"
export HISTSIZE=10000

shopt -s cmdhist
shopt -s histappend

# Tab complete in sudo
complete -cf sudo

# Aliases
alias vi='vim'
alias dt='ls -R | grep ":$" | sed -e "s/:$//" -e "s/[^-][^\/]*\//--/g" -e "s/^/ /" -e "s/-/|/"'
alias sl='ls'
alias rebase_all='for dir in ./*; do (cd $dir; git pull --rebase); done'

# Enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
fi

# Print current banch
function git_branch {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return
    echo ${ref#refs/heads/}
}

# Display unstaged (*) and staged(+) changes
export GIT_PS1_SHOWDIRTYSTATE="1"
# Display whether there are stashed ($) changes
export GIT_PS1_SHOWSTASHSTATE="1"
# Display if there are untracked (%) files
export GIT_PS1_SHOWUNTRACKEDFILES="1"
# Display if we're ahead (>) or behind (<) or diverged (<>) relative to upstream
export GIT_PS1_SHOWUPSTREAM="auto"

# Colors
color_off='\e[0m' # Text Reset
black='\e[0;30m' # Black
red='\e[0;31m' # Red
orange='\e[1;31m' # Orange
green='\e[0;32m' # Green
yellow='\e[0;33m' # Yellow
blue='\e[0;34m' # Blue
purple='\e[0;35m' # Purple
cyan='\e[0;36m' # Cyan
white='\e[0;37m' # White
PS1="\[${green}\]\u\[${white}\]@\[${blue}\]\h \[${yellow}\]\w\[${orange}\] \$(git_branch)\n\[${green}\]$ \[${color_off}\]"

source ~/.workrc
