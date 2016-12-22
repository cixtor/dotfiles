#!/bin/bash
#
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# Source global definitions
if [ -f /etc/bash.bashrc ]; then
    source /etc/bash.bashrc
fi

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTFILESIZE=2000
HISTSIZE=1000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# Additional binary location.
export PATH="$PATH:/usr/local/sbin"

# https://github.com/cixtor/powergoline
# go get -u github.com/cixtor/powergoline
export PROMPT_COMMAND="set_prompt_command; $PROMPT_COMMAND"
# PS1='\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[1;33m\]\u@\h: \[\033[1;34m\]\w\[\033[00m\] \$ '
function set_prompt_command() {
    export PS1="$(powergoline $? 2> /dev/null)"
}

# LS-Colors
LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01'
LS_COLORS+=':cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42'
LS_COLORS+=':st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31'
LS_COLORS+=':*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31'
LS_COLORS+=':*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31'
LS_COLORS+=':*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31'
LS_COLORS+=':*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.ace=01;31'
LS_COLORS+=':*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35'
LS_COLORS+=':*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35'
LS_COLORS+=':*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35'
LS_COLORS+=':*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35'
LS_COLORS+=':*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35'
LS_COLORS+=':*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35'
LS_COLORS+=':*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35'
LS_COLORS+=':*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35'
LS_COLORS+=':*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36'
LS_COLORS+=':*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36'
LS_COLORS+=':*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36'
LS_COLORS+=':*.spx=00;36:*.xspf=00;36'
export LS_COLORS

# Set version control system commit editor.
export EDITOR=vim
export HGEDITOR=vim
export GIT_EDITOR=vim

# Disable Homebrew analytics
export HOMEBREW_NO_ANALYTICS=1

# Remove Homebrew's stupid emoji
export HOMEBREW_NO_EMOJI=1

# GoLang - http://golang.org/
# https://golang.org/doc/install
# https://golang.org/pkg/#stdlib
# https://golang.org/doc/articles/race_detector.html
export GOROOT="/opt/golang/build"
export GOPATH="/opt/golang/gopath"
export GORACE="log_path=stderr exitcode=66"
export PATH="$PATH:$GOROOT/bin"
export PATH="$PATH:$GOPATH/bin"

# Rust - https://www.rust-lang.org/
export RUST_SRC_PATH="/opt/rustlang/source/src/"
export PATH="$PATH:/opt/rustlang/packages/bin"
export PATH="$PATH:/opt/rustlang/bin"
export PATH="$PATH:$HOME/.cargo/bin"

# IPFS is the Distributed Web
# https://ipfs.io/
export PATH="$PATH:/opt/ipfs"
export IPFS_PATH="$HOME/IPFS"

# General-Purpose Programming Language
export PATH="$PATH:/opt/qtcreator/Tools/QtCreator/bin" # https://www.qt.io/ide/
export PATH="$PATH:/opt/dlang/bin" # https://dlang.org/
export PATH="$PATH:/opt/kore/bin" # https://kore.io/
export PATH="$PATH:/opt/ruby/bin" # https://www.ruby-lang.org/en/
export PATH="$PATH:/opt/rvm/bin" # https://rvm.io/
export PATH="$PATH:/opt/php/bin" # https://secure.php.net/
export PATH="$PATH:/opt/php/sbin" # https://secure.php.net/
export PATH="$PATH:/opt/nodejs/bin" # https://nodejs.org/en/
export PATH="$PATH:/opt/coffeescript/bin" # http://coffeescript.org/

# LLVM Compiler Infrastructure
# http://llvm.org/releases/download.html
export PATH="$PATH:/opt/llvm/bin"

# Java and Android Development Environment
export JAVA_HOME="/opt/javadevkit"
export PATH="$PATH:/opt/javadevkit/bin"
export PATH="$PATH:/opt/android-studio/bin"

# Revision Control System (RCS)
export PATH="$PATH:/opt/gitscm/bin" # https://git-scm.com/
export PATH="$PATH:/opt/mercurial/bin" # https://www.mercurial-scm.org/
export PATH="$PATH:/opt/subversion/bin" # https://subversion.apache.org/
export PATH="$PATH:/opt/meld/bin" # http://meldmerge.org/

# Miscellaneous Apps
export PATH="$PATH:/opt/commonbin"
export PATH="$PATH:/opt/mamutools"
export PATH="$PATH:/opt/standalone"
export PATH="$PATH:/opt/neovim/bin" # https://github.com/neovim/neovim
export PATH="$PATH:/opt/phpshellgen" # https://github.com/cixtor/phpshellgen
export PATH="$PATH:/opt/bind9utils/bin" # https://wiki.debian.org/Bind9
export PATH="$PATH:/opt/treecommand/bin" # http://mama.indstate.edu/users/ice/tree/
export PATH="$PATH:/opt/colordiff/bin" # https://github.com/daveewart/colordiff
export PATH="$PATH:/opt/powertop" # https://github.com/fenrus75/powertop
export PATH="$PATH:/opt/ngrok/bin" # https://ngrok.com/
export PATH="$PATH:/opt/nmap/bin" # https://nmap.org/
export PATH="$PATH:/opt/phpsa/bin" # https://github.com/ovr/phpsa
export PATH="$PATH:/opt/php7cc/bin" # https://github.com/sstalle/php7cc
export PATH="$PATH:/opt/pfff/bin" # https://github.com/facebook/pfff
export PATH="$PATH:/opt/siege" # https://github.com/JoeDog/siege
export PATH="$PATH:/opt/xsser" # https://xsser.03c8.net/
export PATH="$PATH:/opt/wpscan" # https://github.com/wpscanteam/wpscan
export PATH="$PATH:/opt/phan" # https://github.com/etsy/phan
export PATH="$PATH:/opt/apktool" # https://github.com/iBotPeaches/Apktool
export PATH="$PATH:/opt/ttygif/bin" # https://github.com/icholy/ttygif
export PATH="$PATH:/opt/hexedit/bin" # http://www.hexedit.com/
export PATH="$PATH:/opt/phantomjs/bin" # http://phantomjs.org/
export PATH="$PATH:/opt/casperjs/bin" # http://casperjs.org/
export PATH="$PATH:/opt/charlesproxy/bin" # https://www.charlesproxy.com/
export PATH="$PATH:/opt/geoloc/bin" # https://github.com/loadzero/geoloc
export PATH="$PATH:/opt/heroku/bin" # https://toolbelt.heroku.com/
export PATH="$PATH:/opt/ncftp/bin" # http://www.ncftp.com/
export PATH="$PATH:/opt/lnav" # http://lnav.org/
export PATH="$PATH:/opt/nwjs" # https://github.com/nwjs/nw.js/
export PATH="$PATH:/opt/iographica" # http://iographica.com/
export PATH="$PATH:/opt/yuicompressor" # https://github.com/yui/yuicompressor
export PATH="$PATH:/opt/wkhtmltox/bin" # http://wkhtmltopdf.org/
export PATH="$PATH:/opt/hugo" # http://gohugo.io/
export PATH="$PATH:/opt/vegeta/bin" # https://github.com/tsenart/vegeta
export PATH="$PATH:/opt/fierce/bin" # http://git.kali.org/gitweb/?p=packages/fierce.git
export PATH="$PATH:/opt/metagoofil/bin" # https://github.com/laramies/metagoofil

# Database Engines
export PATH="$PATH:/opt/redis/bin" # http://redis.io/
export PATH="$PATH:/opt/postgresql/bin" # https://www.postgresql.org/
export PATH="$PATH:/opt/mongodb/bin" # https://www.mongodb.com/
export PATH="$PATH:/opt/mysql/bin" # https://www.mysql.com/
export PATH="$PATH:/opt/sqlite/bin" # https://sqlite.org/

# Web Server and Performance
export PATH="$PATH:/opt/apache/bin" # http://www.apache.org/
export PATH="$PATH:/opt/nginx/sbin" # https://www.nginx.com/
export PATH="$PATH:/opt/varnish/bin" # https://varnish-cache.org/
export PATH="$PATH:/opt/memcached/bin" # https://memcached.org/
export PATH="$PATH:/opt/prax/bin" # https://github.com/ysbaddaden/prax

# HashiCorp: app development, delivery, and maintenance
export PATH="$PATH:/opt/hashicorp/otto" # https://github.com/hashicorp/otto
export PATH="$PATH:/opt/hashicorp/nomad" # https://github.com/hashicorp/nomad
export PATH="$PATH:/opt/hashicorp/vault" # https://github.com/hashicorp/vault
export PATH="$PATH:/opt/hashicorp/consul" # https://github.com/hashicorp/consul
export PATH="$PATH:/opt/hashicorp/packer" # https://github.com/mitchellh/packer
export PATH="$PATH:/opt/hashicorp/serfdom" # https://github.com/hashicorp/serf
export PATH="$PATH:/opt/hashicorp/terraform" # https://github.com/hashicorp/terraform
export PATH="$PATH:/opt/hashicorp/vagrant/bin" # https://github.com/mitchellh/vagrant

# Export the location of the SublimeText command line shortcut.
export PATH="$PATH:/Applications/Sublime Text.app/Contents/SharedSupport/bin"

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.aliases, instead of adding them here directly. See examples at
# /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f "$HOME/.aliases" ]; then
    source "$HOME/.aliases"
fi

# Include private additional settings.
if [ -f "$HOME/.private" ]; then
    source "$HOME/.private"
fi
