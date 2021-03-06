# -------------- ls --------------------------------------------------------------------
alias ll='ls -AlhFt'
alias la='ls -A'
alias l='ls -CF'
alias ls='ls --color=auto'

# -------------- grep ------------------------------------------------------------------
alias grep='grep --colour=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# ------------- apt --------------------------------------------------------------------
alias acs='apt-cache search '
alias agi='apt-get install '
alias agd='apt-get update'
alias agg='apt-get upgrade'
alias aar='add-apt-repository '
alias agp='apt-get purge '
alias aga='apt-get autoremove'
alias acp='apt-cache policy '

# ----------- sudo ---------------------------------------------------------------------
alias sudo='sudo ' # Use sudo with user bash aliases.
alias s='sudo '
alias fok='sudo $(history -p \!\!)'

# ------ linux mint --------------------------------------------------------------------
alias cinnamon_restart='killall cinnamon && export DISPLAY=:0.0 && cinnamon --replace &'
alias update='sudo apt-get update && sudo apt-get upgrade && sudo apt-get autoremove'

# --------- cd -------------------------------------------------------------------------
alias ....='cd ../..'
alias ..='cd ..'

# --------------- Virtualenvwrapper ----------------------------------------------------
alias mkv='mkvirtualenv '
alias rmv='rmvirtualenv '
alias mkp='mkproject '
alias mktv='mktmpenv '
alias lsv='lsvirtualenv '
alias shwv='showvirtualenv '
alias cpv='cpvirtualenv '
alias allv='allvirtualenv '
alias cdv='cdvirtualenv '
alias add2v='add2virtualenv '
alias wpv='wipeenv '
alias cdp='cdproject '

# ------------- Vagrant ----------------------------------------------------------------
alias vi='vagrant init '
alias vu='vagrant up '
alias vs='vagrant ssh '
alias vh='vagrant halt '

# ------------- MyCLI ------------------------------------------------------------------
alias mytc='mycli -u root -h testcalls-pegasus -D TestCalls '

# ------------- Vim --------------------------------------------------------------------
alias v='vim '
alias vr='vim -R '

# ------------- Nginx ------------------------------------------------------------------
alias nxt='sudo nginx -t && sudo service nginx '

# ------------- Git --------------------------------------------------------------------
alias g='git '

# ------------ Diff --------------------------------------------------------------------
alias diff='colordiff '

# --------- Neovim ---------------------------------------------------------------------
# Colide with nvm(node version manager)
# alias nvm='nvim '


# --------- Python ---------------------------------------------------------------------
alias ipy='~/.pyenv/versions/default/bin/ipython'


# --------- Make
alias m='make '

# ---- Pyenv
# FIXME: It seems to use the previously visited direrectory as PWD instead of the current one...
alias pav="pyenv activate $(basename ${PWD})"
alias plv="pyenv virtualenvs | cut -d ' ' -f3 | grep -v '^[0-9]'"
alias pli="pyenv versions --bare --skip-aliases | cut -d'/' -f1 | uniq"


# ---- Docker ---
# NOTE: This will override dc a.k.a GNU desk calculator,
#		I never use it so I don't case but still it should be known.
alias dc="docker-compose "
