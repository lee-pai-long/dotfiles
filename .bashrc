# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Two lines prompt
PS1="\[\033[38;5;202m\][\t]\[\033[38;5;15m\] \[\033[38;5;41m\]\u\[\033[38;5;15m\] @ \[\033[38;5;33m\]\H\[\033[38;5;15m\] : \[\033[38;5;11m\]\w\[\033[38;5;15m\]\n\\$ "

#Get a container IP using container ID
docker-ip() { sudo docker inspect --format '{{ .NetworkSettings.IPAddress }}' "$@"; }

#Load exercism.io bash completion
if [ -f ~/.config/exercism/exercism_completion.bash ]; then
	. ~/.config/exercism/exercism_completion.bash
fi

PATH="$HOME/perl5/bin${PATH+:}${PATH}"; export PATH;
PERL5LIB="$HOME/perl5/lib/perl5${PERL5LIB+:}${PERL5LIB}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT+:}${PERL_LOCAL_LIB_ROOT}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"$HOME/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"; export PERL_MM_OPT;
export GOPATH=$HOME/.go

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Projects/python
source /usr/local/bin/virtualenvwrapper.sh
