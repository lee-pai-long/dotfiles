# -------------- ls -----------------------------------------------------------------------------
alias ll='ls -AlhFt'
alias la='ls -A'
alias l='ls -CF'
alias ls='ls --color=auto'

# -------------- grep ---------------------------------------------------------------------------
alias grep='grep --colour=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# ------------- apt ------------------------------------------------------------------------------
alias acs='apt-cache search '
alias agi='apt-get install '
alias agd='apt-get update'
alias agg='apt-get upgrade'
alias aar='add-apt-repository '
alias agp='apt-get purge '
alias aga='apt-get autoremove'
alias acp='apt-cache policy '

# ----------- sudo -------------------------------------------------------------------------------
alias s='sudo '
alias fuck='sudo $(history -p \!\!)'

# ------ linux mint ------------------------------------------------------------------------------
alias cinnamon_restart='killall cinnamon && export DISPLAY=:0.0 && cinnamon --replace &'


# --------- cd -----------------------------------------------------------------------------------
alias ....='cd ../..'
alias ..='cd ..'

# --------------- Virtualenvwrapper --------------------------------------------------------------
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

# ------------- Vagrant --------------------------------------------------------------------------
alias vi='vagrant init '
alias vu='vagrant up '
alias vs='vagrant ssh '
alias vh='vagrant halt '

# ------------- MyCLI ----------------------------------------------------------------------------
alias mytc='mycli -u root -h testcalls-pegasus -D TestCalls '

# ------------- Vim ------------------------------------------------------------------------------
alias v='vim '
alias vr='vim -R '
alias vs='sudo vim '

# ------------- Nginx ----------------------------------------------------------------------------
alias nxt='sudo nginx -t && sudo service nginx '

# ------------- Git ------------------------------------------------------------------------------
alias g='git '

# ------------ Diff ------------------------------------------------------------------------------
alias diff='colordiff '

# --------- Neovim -------------------------------------------------------------------------------
alias nvm='nvim '