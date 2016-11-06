#!/usr/bin/env bash
# This function create the directory given in argument,
# move into it then create a virtualenv using virtualenvwrapper
# and start to work on the project.

initpyproject() {
        if [ ! -d $PROJECT_HOME/$* ]; then
            mkdir $PROJECT_HOME/$*
        fi
        cd $PROJECT_HOME/$* \
     && mkvirtualenv --python=/usr/bin/python3 -a ${PWD} $* --no-site-packages
     # weirdly enough mkvirtualenv doesn't return 0 when finished so we have to check if the directory is created
        if [ -d $WORKON_HOME/$* ]; then
            workon $*
        fi
}
