# --------------------------------------------------------------------------------------------------------------------------------------------
# Author: Lee Pai Long <lee-pai-long@users.noreply.github.com>
# Date:   2016-04-02 03:05:41
# Last modified by Lee Pai Long on 2016-04-20 17:57:12
# License: WTFPL <http://www.wtfpl.net/>
# --------------------------------------------------------------------------------------------------------------------------------------------

# ----------------------- color settings -----------------------------------------------------------------------------------------------------
#show color by for structure:
# $ for code in {0..255}; do echo -e "\e[38;05;${code}m $code: Test"; done
orange="\e[38;05;202m"
white="\e[38;05;15m"
green="\e[38;05;41m"
blue="\e[38;05;33m"
yellow="\e[38;05;11m"
red="\e[38;05;9m"

# ----------------------------- Two lines prompt ---------------------------------------------------------------------------------------------
# [11:07:45] user @ host : /path/
# $ command
PS1="$orange[\t] $green\u $white@ $blue\H $white: $yellow\w$white\n\\$ "

# ---------------------- history settings ----------------------------------------------------------------------------------------------------
# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

# After each command, append to the history file and reread it:
# history -a => append the new history lines (history lines entered since the beginning of the current Bash session) to the history file.
# history -c => clears the history of the running session. This will reduce the history counter by the amount of $HISTSIZE.
# history -r => read the contents of $HISTFILE and insert them in to the current running session history.
# this will raise the history counter by the amount of lines in $HISTFILE.
# In result history number may look weird on current session sometimes but after closing all session the order seems to get back correctly
# NOTE: If the same command is execute on multiple session, the ignoredubs directive doesn't work
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

#Add date in history
export HISTTIMEFORMAT="%d/%m/%y %T "

# ----------------------- hstr(hh) config options (https://github.com/dvorka/hstr) -----------------------------------------------------------
# - hicolor: Get hh in more colors
# - favorites: Show favorite commands by default (instead of metrics-based view)
#              favorites file should be store in ~/.hh_favorites
# - casesensitive: Make search case sensitive (insensitive by default)
# - blacklist: Skip commands when processing history i.e. make sure that these commands will not be shown in any view
#              blacklist file should be store in ~/.hh_blacklist
export HH_CONFIG=hicolor,favorites,casesensitive,blacklist

# Change hh prompt string
export HH_PROMPT="$USER @ $HOSTNAME : $PWD $ "

# if this is interactive shell, then bind hh to Ctrl-h instead of Ctrl-r, this allow us to have the two features available
if [[ $- =~ .*i.* ]]; then bind '"\C-h": "\C-a hh \C-j"'; fi

# --------------------------------------------------------------------------------------------------------------------------------------------

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
