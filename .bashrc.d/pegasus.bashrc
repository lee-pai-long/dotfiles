# ----------------------- hstr(hh) config options (https://github.com/dvorka/hstr) -----------------------------------------------------------
# - hicolor: Get hh in more colors
# - favorites: Show favorite commands by default (instead of metrics-based view)
#              favorites file should be store in ~/.hh_favorites
# - casesensitive: Make search case sensitive (insensitive by default)
# - blacklist: Skip commands when processing history i.e. make sure that these commands will not be shown in any view
#              blacklist file should be store in ~/.hh_blacklist
export HH_CONFIG=hicolor,favorites,casesensitive,blacklist

# Change hh prompt string
export HH_PROMPT="$USER @ $HOSTNAME : $PWD $ "

# if this is interactive shell, then bind hh to Ctrl-h instead of Ctrl-r, this allow us to have the two features available
if [[ $- =~ .*i.* ]]; then bind '"\C-h": "\C-a hh \C-j"'; fi

# Get a container IP using container ID
docker-ip() { sudo docker inspect --format '{{ .NetworkSettings.IPAddress }}' "$@"; }

# Load exercism.io bash completion
if [ -f ~/.config/exercism/exercism_completion.bash ]; then
	. ~/.config/exercism/exercism_completion.bash
fi

# Go utils
export GOPATH=/$HOME/.go

# Python virtualenvwrapper utils
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/projects/perso
source /usr/local/bin/virtualenvwrapper.sh

export SALT_CONFIG_DIR=$HOME/salt/etc

# Change the default connect URI in libvirt
export LIBVIRT_DEFAULT_URI="qemu:///system"

# add entries for plenv (see: https://github.com/tokuhirom/plenv)
if [ -d "$HOME/.plenv/bin" ] ; then
	export PATH="$HOME/.plenv/bin:$PATH"
fi

eval "$(plenv init -)"
