#!/usr/bin/env bash
# Update prompt with virtualenv.
#
# Should work with any virtualenv tool.
# Force prompt update with pyenv-virtualenv.
# see: https://github.com/pyenv/pyenv-virtualenv/issues/135
#
# Usage:
#   - Load it in your .bashrc after defining
#     $ORIGINAL_PROMPT instead of PS1.
#     Then add a line export PROMPT_COMMAND='venv-prompt'
#     to allow Bash to executes this function just before
#     displaying the PS1 variable.
function venv-prompt {

    WANTED_PROMPT="(${VIRTUAL_ENV##*/}) $ORIGINAL_PROMPT"
    # Current virtualenv
    if [[ $VIRTUAL_ENV != "" ]] && [[ $PS1 != "$WANTED_PROMPT" ]]; then
        PROMPT=$WANTED_PROMPT
    else
        PROMPT=$ORIGINAL_PROMPT
    fi
    PS1="$PROMPT"
}
export -f venv-prompt
