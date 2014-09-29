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

PS1='\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[1;33m\]\u@\h: \[\033[1;34m\]\w\[\033[00m\] \$ '

# GoLang - http://golang.org/
export GOROOT="/opt/golang/build"
export GOPATH="/opt/golang/gopath"
export PATH="$PATH:$GOROOT/bin"

# Revision Control System (RCS)
export PATH="$PATH:/opt/gitscm/bin"
export PATH="$PATH:/opt/mercurial/bin"
export PATH="$PATH:/opt/subversion/bin"

# MamuTools - https://github.com/cixtor/mamutools
export PATH="$PATH:/opt/mamutools"
export PATH="$PATH:/opt/standalone"
export PATH="$PATH:/opt/phpshellgen"

# Java Development Kit (JDK)
export PATH="$PATH:/opt/javadevkit/bin"

# Miscellaneous Apps
export PATH="$PATH:/opt/powertop"
export PATH="$PATH:/opt/colordiff/bin"
export PATH="$PATH:/opt/nmap/bin"
export PATH="$PATH:/opt/nodewebkit"

# General-Purpose Programming Language
export PATH="$PATH:/opt/nodejs/bin"
export PATH="$PATH:/opt/lampstack/php/bin"
export PATH="$PATH:/opt/lampstack/ruby/bin"
export PATH="$PATH:/opt/coffeescript/bin"

# Databases
export PATH="$PATH:/opt/redis/bin"
export PATH="$PATH:/opt/mongodb/bin"
export PATH="$PATH:/opt/lampstack/mysql/bin"
export PATH="$PATH:/opt/lampstack/sqlite/bin"

# Web Server and Performance
export PATH="$PATH:/opt/lampstack/apache2/bin"
export PATH="$PATH:/opt/lampstack/varnish/bin"
export PATH="$PATH:/opt/prax/bin"

# App Distribution and Deployment
export PATH="$PATH:/opt/packer/bin"
export PATH="$PATH:/opt/vagrant/bin"
export PATH="$PATH:/opt/lampstack/heroku/bin"

# Encodes URL string with their correspondent hex digits
alias urlenc='strconv -urlenc -text'

# Decodes URL-encoded string
alias urldec='strconv -urldec -text'

# Convert all the characters in a text string into their capital form
alias uppercase='strconv -uppercase -text'

# Decodes data encoded with MIME base64
alias b64dec='strconv -b64dec -text'

# Encodes data with MIME base64
alias b64enc='strconv -b64enc -text'

# Calculate the sha1 hash of the string specified
alias sha1='strconv -sha1 -text'

# Calculate the md5 hash of the string specified
alias md5='strconv -md5 -text'

# Returns the length of the string specified
alias length='strconv -length -text'

# Convert a text string into a capitalized version of its words
alias capitalize='strconv -capitalize -text'

# Convert all the characters in a text string into their lower form
alias lowercase='strconv -lowercase -text'

# Perform a rotation on a string by the value specified
function rotate() {
    # Positions to shift the text in the alphabet
    if [ "${2}" == "" ]; then pos=13; else pos=$2; fi
    strconv -rotate -text $1 -num $pos
}

# Replace a text string with another
function replace() {
    # new: Text string that will replace the old one
    # old: Text string that will be replaced
    strconv -replace -text $1 -old $2 -new $3
}
