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

# LS-Colors
alias ls='ls --color'
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
