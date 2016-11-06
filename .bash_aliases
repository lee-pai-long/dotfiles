# TODO: Put in files inside a .bash_aliases.d
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

# -------------- Pegasus Shortcuts ---------------------------------------------------------------
# TODO: Put it in a pegasus file
alias gosmb='cd ~/projects/fraudbuster/simbuster'
alias gotc='cd ~/projects/fraudbuster/testcalls'
alias gocl='cd ~/vagrant/controlLayer/'
alias gopjt='cd ~/projects'

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
alias vti='vagrant init '
alias vtu='vagrant up '
alias vtsh='vagrant ssh '
alias vts='vagrant suspend '
alias vtr='vagrant reload '
alias vth='vagrant halt '
alias vtd='vagrant destroy '

# ------------- MyCLI ----------------------------------------------------------------------------
alias mytc='mycli -u root -h testcalls-pegasus -D TestCalls '

# ------------- Vim ------------------------------------------------------------------------------
alias v='vim '
alias vr='vim -R '
alias vs='sudo vim '

# ------------- Nginx ----------------------------------------------------------------------------
alias nxt='sudo nginx -t && sudo service nginx '

# ------------- Git ------------------------------------------------------------------------------
# TODO: Replace all following aliases by git aliases and just add a alias g for git
alias gi='git init '
alias ga='git add '
alias gta='git add .'
alias gs='git status '
alias gc='git commit '
alias gd='git diff '
alias gco='git checkout '
alias gl='git lg '
alias gal='git aliases'
alias gms='git ms ' # show commit message
alias gpl='git pull '
alias gps='git push '
alias grm='git rm '

# ------------ Libvirt ---------------------------------------------------------------------------
alias vsrt='virsh start '
alias smbd='simbusterV5-dev'

# ------------ FraudBuster -----------------------------------------------------------------------
alias bart='ssh bart'
alias stand='ssh stcsbp'
alias dev7='ssh dev7'

# ------------ Diff ------------------------------------------------------------------------------
alias diff='colordiff '

# --------- Neovim -------------------------------------------------------------------------------
alias nvm='nvim '
