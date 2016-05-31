# --------------------------------------------------------------------------------
# Author: Lee Pai Long <lee-pai-long@users.noreply.github.com>
# Date:   2016-04-20 17:26:59
# Last modified by Lee Pai Long on 2016-04-20 17:56:33
# License: WTFPL <http://www.wtfpl.net/>
# --------------------------------------------------------------------------------

alias ll='ls -AlhF'
alias la='ls -A'
alias l='ls -CF'
alias ls='ls --color=auto'
alias grep='grep --colour=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias acs='apt-cache search '
alias agi='apt-get install '
alias agu='apt-get update'
alias sudo='sudo '
alias aar='add-apt-repository '
alias agp='apt-get purge '
alias cinnamon_restart='killall cinnamon && export DISPLAY=:0.0 && cinnamon --replace &'
alias fuck='sudo $(history -p \!\!)'
alias aga='apt-get autoremove'
alias rm='trash'
alias ..='cd ..'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ....='cd ../..'
alias mkvenv='mkvirtualenv --python=/usr/bin/python3 -a ${PWD} ${PWD##*/} --no-site-packages'
alias mkvenv3.4='mkvirtualenv --python=/usr/bin/python3.4 -a ${PWD} ${PWD##*/} --no-site-packages'
# TODO: escape properly
#alias hist='history | awk -F ' ' '{ printf("\033[38;5;9m%s \033[38;5;33m%s \033[38;5;11m%s ",$1,$2,$3); $1=$2=$3=""; gsub(/^[ \t]+/,"",$0); print "\033[38;5;15m"$0; }'
