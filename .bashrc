# NOTE: By convention 'source' is used like an 'import' statement
#       while '.' is used like an 'exec' statement.
#       Remember that both do exactly the same thing though.
# ----------------------- color settings -----------------------------------------------
#show color by for structure:
# $ for code in {0..255}; do echo -e "\e[38;05;${code}m $code: Test"; done
orange="\e[38;05;202m"
white="\e[38;05;15m"
green="\e[38;05;41m"
blue="\e[38;05;33m"
yellow="\e[38;05;11m"
red="\e[38;05;9m"

# ----------------------------- Two lines prompt ---------------------------------------
# [11:07:45] user @ host : /path/
# $ command
PS1="$orange[\t] $green\u $white@ $blue\H $white: $yellow\w$white\n\\$ "

# ---------------------- history settings ----------------------------------------------
# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

# After each command, append to the history file and reread it:
# history -a => append the new history lines to the history file.
#               (history lines entered since the beginning of the current Bash session)
# history -c => clears the history of the running session.
#               This will reduce the history counter by the amount of $HISTSIZE.
# history -r => read the contents of $HISTFILE and insert them
#               in to the current running session history.
# This will raise the history counter by the amount of lines in $HISTFILE.
# In result history number may look weird on current session sometimes
# but after closing all session the order seems to get back correctly
# NOTE: If the same command is execute on multiple session,
#       the ignoredubs directive doesn't work.
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Add date in history
export HISTTIMEFORMAT="%d/%m/%y %T "

# ----------------------- alias definitions --------------------------------------------
if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

BASH_FUNC_DIR=$HOME/.bash_functions
if [ -d $BASH_FUNC_DIR ]; then
    for file in $BASH_FUNC_DIR/*.sh; do
        source $file
    done
fi

LOCAL_BASHRC='.local.bashrc'
if [ -f $LOCAL_BASHRC ]; then
        source $LOCAL_BASHRC
fi

# set PATH so it includes user's private bin if it exists
USER_BIN="$HOME/.bin"
if [ -d $USER_BIN ] ; then
    export PATH="$USER_BIN:$PATH"
fi

# set vim as default editor.
export VISUAL=vim
export EDITOR="$VISUAL"
