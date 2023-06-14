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
cyan="\e[38;05;14m"

# ----------------------- prompt settings ----------------------------------------------

# user at host in path as (venv) on (git branch) at [time]
# $ command
function prompter {
    export PYENV_VIRTUALENV_DISABLE_PROMPT=1
    ORIGINAL_PROMPT="$green\u$white on $blue\H$white in $yellow\w"
	GIT_PROMPT_SH="$HOME/.git-prompt.sh"
	if [[ -f "$GIT_PROMPT_SH" ]]; then
		source "$GIT_PROMPT_SH"
		GIT_PROMPT=$(__git_ps1 "$white on $red%s")
	else
		GIT_PROMPT=""
	fi
    VENV_PROMPT="$white as $cyan${VIRTUAL_ENV##*/}"
    WANTED_PROMPT="$ORIGINAL_PROMPT""$VENV_PROMPT""$GIT_PROMPT"
    if [ -n "$(type -t __git_ps1)" ]; then
        if [[ $VIRTUAL_ENV != "" ]] && [[ $PS1 != "$WANTED_PROMPT" ]]; then
            PROMPT="$WANTED_PROMPT"
        else
            PROMPT="$ORIGINAL_PROMPT""$GIT_PROMPT"
        fi
    else
        PROMPT="$ORIGINAL_PROMPT"
    fi
    PS1="$PROMPT""$white at $orange\t$white\n\$ "
	# TODO: Check if this works properly,
	# from https://superuser.com/a/570019/642267
	# bashrc_sourced=$(stat -c %Y ~/.bashrc)
	# test $(stat -c %Y ~/.bashrc) -ne $bashrc_sourced && source ~/.bashrc
}
export -f prompter
export PROMPT_COMMAND='prompter'

# ---------------------- history settings ----------------------------------------------
# Don't put duplicate lines or lines starting with space in the history.
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

BASH_FUNC_DIR="$HOME/.bash_functions"
if [ -d "$BASH_FUNC_DIR" ]; then
    for file in $BASH_FUNC_DIR/*; do
        source "$file"
    done
    # Bash shell executes this function just before displaying the PS1 variable.
    # venv-prompt is loaded from a bash function.
    # BUG: Doesn't always work...
    # export PROMPT_COMMAND='venv-prompt'
fi

LOCAL_BASHRC="$HOME/.local.bashrc"
if [ -f "$LOCAL_BASHRC" ]; then
    source "$LOCAL_BASHRC"
fi

# set PATH so it includes user's private bin if it exists
USER_BIN="$HOME/bin"
if [ -d "$USER_BIN" ]; then
    export PATH="$USER_BIN:$PATH"
fi

# set vim as default editor.
export VISUAL=vim
export EDITOR="$VISUAL"

BASH_COMPLETION_DIR="$HOME/.bash_completion.d"
if [ -d "$BASH_COMPLETION_DIR" ]; then
    for completion in $BASH_COMPLETION_DIR/*; do
		source "$completion"
    done
fi

GIT_COMPLETION="/usr/share/bash-completion/completions/git"
if [ -f $GIT_COMPLETION ]; then
   source $GIT_COMPLETION
   __git_complete g __git_main
fi

export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
