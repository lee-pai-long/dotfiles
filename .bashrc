# --------------------------------------------------------------------------------
# Author: Lee Pai Long <lee-pai-long@users.noreply.github.com>
# Date:   2016-04-02 03:05:41
# Last modified by Lee Pai Long on 2016-04-20 17:57:12
# License: WTFPL <http://www.wtfpl.net/>
# --------------------------------------------------------------------------------

# ----------------------- color settings -----------------------------------------
orange="\e[38;5;202m"
white="\e[38;5;15m"
green="\e[38;5;41m"
blue="\e[38;5;33m"
yellow="\e[38;5;11m"
red="\e[38;5;9m"

# ---------------------- history settings -----------------------------------------
# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

#Add date in history
export HISTTIMEFORMAT="%d/%m/%y %T "

# ----------------------------- Two lines prompt ------------------------------------
# [11:07:45] user @ host : /path/
# $ command
PS1="$orange[\t] $green\u $white@ $blue\H $white: $yellow\w$white\n\\$ "
# --------------------------------------------------------------------------------

# Get a container IP using container ID
docker-ip() { sudo docker inspect --format '{{ .NetworkSettings.IPAddress }}' "$@"; }

# Load exercism.io bash completion
if [ -f ~/.config/exercism/exercism_completion.bash ]; then
	. ~/.config/exercism/exercism_completion.bash
fi

# Go utils
export GOPATH=/$HOME/.go

# Python virtualenvwrapper utils
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Projects/python
source /usr/local/bin/virtualenvwrapper.sh

export SALT_CONFIG_DIR=$HOME/salt/etc

if [ -d $HOME/.bash_function ]; then
    for file in $HOME/.bash_function/*.sh; do
        source $file
    done
fi

# Change the default connect URI in libvirt
export LIBVIRT_DEFAULT_URI="qemu:///session"
