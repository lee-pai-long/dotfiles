# Quickly add alias permanently using bash history
#
# param1 : alias name
# param2 : command (use "" to enclose the command)
#
## Usage: add_alias <alias> <"command">
##     * -h  : Show this help.
##     * First argument is the wanted alias name
##     * Second argument is the command (enclose with "")
# FIXME: Help is buggy...
function add_alias() {

    # BASH_SOURCE is an array containing the current execution stack.
    # Since the current script is always at the bottom of the stack,
    # ${BASH_SOURCE[0]} will contain the name of the script that we’re in.
    # cut will output each of the lines that grep sent to it via.
    # pipe with the first 3 characters removed (basically, the comment characters).
    help=$(grep "^## " "${BASH_SOURCE[0]}" | cut -c 4-)

    # If no argument is given show help
    if [ "$#" -ne 1 ]; then
        echo -e $help
        return 1
    fi

    # If the -h flag is given show help
    while getopts "h" opt; do
        echo -e $help
        return 1
    done

    # add the asked alias in the regular shell session
    alias $1="$2"

    # add the alias in the user bash_aliases file
    echo "!!" >> /tmp/alias
}
export -f add_alias
