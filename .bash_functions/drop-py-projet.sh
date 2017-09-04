# Delete the project given in argument.
#
# delete the directory of the given name under $PROJECT_HOME,
# then delete the virtualenv directory linked.
function drop-py-project() {
     # if we still in the project directory move to ~
     if [ $PWD == $* ]; then
        cd
     fi
     if [ "$(ls -A $*)" ]; then
         rm -rf $WORKON_HOME/$*
     else
         rm -rf $PROJECT_HOME/$* $WORKON_HOME/$*
     fi
}
