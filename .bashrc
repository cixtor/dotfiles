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

# Homebrew - https://brew.sh
# The missing package manager for macOS
export HOMEBREW_NO_EMOJI=1     # Remove Homebrew's stupid emoji
export HOMEBREW_NO_ANALYTICS=1 # Disable Homebrew analytics

# GoLang - http://golang.org/
# https://golang.org/doc/install
# https://golang.org/pkg/#stdlib
# https://golang.org/doc/articles/race_detector.html
# brew install go && mkdir -pv /usr/local/opt/gopath
export GOROOT="/usr/local/opt/go/libexec"
export GOPATH="/usr/local/opt/gopath"
export GORACE="log_path=stderr exitcode=66"
export PATH="$PATH:$GOROOT/bin"
export PATH="$PATH:$GOPATH/bin"

# Rust - https://www.rust-lang.org/
# brew install rust && mkdir ~/.cargo
export PATH="$PATH:$HOME/.cargo/bin"

# LLVM Compiler Infrastructure
# http://llvm.org/releases/download.html
export PATH="$PATH:/opt/llvm/bin"

# Java Development Kit
#export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"
#export ANDROID_HOME="/usr/local/share/android-sdk"

# Miscellaneous Apps
export PATH="$PATH:/opt/mamutools"
export PATH="$PATH:/opt/iographica"
export PATH="$PATH:/opt/phpshellgen"
export PATH="$PATH:/Applications/Sublime Text.app/Contents/SharedSupport/bin"

# Expose gettext binaries
export PATH="$PATH:/usr/local/opt/gettext/bin"

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
