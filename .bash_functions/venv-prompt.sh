# Update prompt with virtualenv
#
# Usage load it in your .bashrc after defining $ORIGINAL_PROMPT instead of PS1.
function venv-prompt {

    WANTED_PROMPT="(${VIRTUAL_ENV##*/}) $ORIGINAL_PROMPT"
    # Current virtualenv
    if [[ $VIRTUAL_ENV != "" ]] && [[ $PS1 != $WANTED_PROMPT ]]; then
        PROMPT=$WANTED_PROMPT
    else
        PROMPT=$ORIGINAL_PROMPT
    fi
    PS1="$PROMPT"
}
export -f venv-prompt

# Bash shell executes this function just before displaying the PS1 variable.
export PROMPT_COMMAND='venv-prompt'
