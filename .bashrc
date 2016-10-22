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

# Add date in history
export HISTTIMEFORMAT="%d/%m/%y %T "

# ----------------------- alias definitions ----------------------------------------------------------------------------------------------------
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

export BASH_FUNC_DIR=$HOME/.bash_functions
if [ -d $BASH_FUNC_DIR ]; then
    for file in $BASH_FUNC_DIR/*.sh; do
        source $file
    done
fi

export BASHRC_D=$HOME/.bashrc.d
if [ -d $BASHRC_D ]; then
    for file in $BASHRC_D/*.bashrc; do
        . $file
    done
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    export PATH="$HOME/bin:$PATH"
fi

# ---------------------- npm utils --------------------------------------------------------------------------------------------------------------
# source: https://github.com/sindresorhus/guides/blob/master/npm-global-without-sudo.md
NPM_PACKAGES="${HOME}/.npm"

PATH="$NPM_PACKAGES/bin:$PATH"

# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
unset MANPATH # delete if you already modified MANPATH elsewhere in your config
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"
