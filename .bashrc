# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# Source global definitions
if [ -f /etc/bash.bashrc ]; then
        . /etc/bash.bashrc
fi

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"


# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac


# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# mint-fortune
/usr/bin/mint-fortune

PS1='\[\e]0;\u@\h: \w\a\]\[\033[0;31m\]$(returncode)\[\033[0;37m\]\[\033[0;35m\]${debian_chroot:+($debian_chroot)}\[\033[01;33m\]\u@\h \[\033[01;34m\]\w\[\033[00m\] \$ '

# GoLang - http://golang.org/
export GOROOT="/home/system/opt/golang"
export PATH="$PATH:$GOROOT/bin"

# Revision Control System (RCS)
export PATH="$PATH:/home/system/opt/gitscm/bin"
export PATH="$PATH:/home/system/opt/mercurial/bin"
export PATH="$PATH:/home/system/opt/subversion/bin"

# MamuTools - https://github.com/cixtor/mamutools
export PATH="$PATH:/home/system/opt/mamutools"

# Java Development Kit (JDK)
export PATH="$PATH:/home/system/opt/javadevkit/bin"

# Miscellaneous Apps
export PATH="$PATH:/home/system/opt/powertop"
export PATH="$PATH:/home/system/opt/colordiff/bin"
export PATH="$PATH:/home/system/opt/hacking/nmap/build/bin"

# General-Purpose Programming Language
export PATH="$PATH:/home/system/opt/nodejs/bin"
export PATH="$PATH:/home/system/opt/lampstack/php/bin"
export PATH="$PATH:/home/system/opt/lampstack/ruby/bin"

# Databases
export PATH="$PATH:/home/system/opt/redis/bin"
export PATH="$PATH:/home/system/opt/mongodb/bin"
export PATH="$PATH:/home/system/opt/lampstack/mysql/bin"
export PATH="$PATH:/home/system/opt/lampstack/sqlite/bin"

# Web Server and Performance
export PATH="$PATH:/home/system/opt/lampstack/apache2/bin"
export PATH="$PATH:/home/system/opt/lampstack/varnish/bin"

# App Distribution and Deployment
export PATH="$PATH:/home/system/opt/packer/bin"
export PATH="$PATH:/home/system/opt/vagrant/bin"
export PATH="$PATH:/home/system/opt/lampstack/heroku/bin"
