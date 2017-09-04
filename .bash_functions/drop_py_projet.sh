# This function delete the directory given in argument,
# then delete the virtualenv directory

function drop_py_project() {
     # if we still in the project directory move to ~
     if [ $PWD = $* ]; then
        cd
     fi
     if [ "$(ls -A $*)" ]; then
         rm -rf $WORKON_HOME/$*
     else
         rm -rf $PROJECT_HOME/$* $WORKON_HOME/$*
     fi
}
