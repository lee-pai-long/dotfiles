Lee Pai Long dotfiles
=====================

...

Collection of bash function to import in ~/.bashrc
--------------------------------------------------

***To use them add the following to .bashrc***

```
BASH_FUNC_DIR=$HOME/.bash_functions
if [ -d $BASH_FUNC_DIR ]; then
    for file in $BASH_FUNC_DIR/*.sh; do
        source $file
    done
fi
```

- **initpyproject:** This function create the directory given in argument,
                     move into it then create a virtualenv using virtualenvwrapper
                     and start to work on the project.
- **droppyproject:** This function delete the directory given in argument,
                     then delete the virtualenv directory.


#### TODO :

- add test for non argument in initpyproject and droppyproject
- add git initialisation, use [this]
- find a unit test framework or try to make it (bats ?)
- Update this README to be more generale.


[this]: https://www.viget.com/articles/create-a-github-repo-from-the-command-line
