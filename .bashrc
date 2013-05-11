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

# https://github.com/cixtor/powergoline
export PROMPT_COMMAND="set_prompt_command; $PROMPT_COMMAND"
# PS1='\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[1;33m\]\u@\h: \[\033[1;34m\]\w\[\033[00m\] \$ '
function set_prompt_command() {
    export PS1="$($HOME/powergoline $? 2> /dev/null)"
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

# Generic aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias cat='cat --show-nonprinting'

# GoLang - http://golang.org/
export GOROOT="/opt/golang/build"
export GOPATH="/opt/golang/gopath"
export PATH="$PATH:$GOROOT/bin"

# Rust - https://www.rust-lang.org/
export RUST_SRC_PATH="/opt/rustlang/source/src/"
export PATH="$PATH:/opt/rustlang/packages/bin"
export PATH="$PATH:/opt/rustlang/bin"

# General-Purpose Programming Language
export PATH="$PATH:/opt/qtcreator/Tools/QtCreator/bin"
export PATH="$PATH:/opt/dlang/bin"
export PATH="$PATH:/opt/kore/bin"
export PATH="$PATH:/opt/ruby/bin"
export PATH="$PATH:/opt/rvm/bin"
export PATH="$PATH:/opt/php/bin"
export PATH="$PATH:/opt/php/sbin"
export PATH="$PATH:/opt/nodejs/bin"
export PATH="$PATH:/opt/coffeescript/bin"

# Java and Android Development Environment
export JAVA_HOME="/opt/javadevkit"
export PATH="$PATH:/opt/javadevkit/bin"
export PATH="$PATH:/opt/android-studio/bin"

# Revision Control System (RCS)
export PATH="$PATH:/opt/gitscm/bin"
export PATH="$PATH:/opt/mercurial/bin"
export PATH="$PATH:/opt/subversion/bin"
export PATH="$PATH:/opt/meld/bin"

# Miscellaneous Apps
export PATH="$PATH:/opt/commonbin"
export PATH="$PATH:/opt/mamutools"
export PATH="$PATH:/opt/standalone"
export PATH="$PATH:/opt/neovim/bin"
export PATH="$PATH:/opt/phpshellgen"
export PATH="$PATH:/opt/cixtorphpcs"
export PATH="$PATH:/opt/bind9utils/bin"
export PATH="$PATH:/opt/treecommand/bin"
export PATH="$PATH:/opt/colordiff/bin"
export PATH="$PATH:/opt/powertop"
export PATH="$PATH:/opt/nmap/bin"
export PATH="$PATH:/opt/pfff/bin"
export PATH="$PATH:/opt/siege"
export PATH="$PATH:/opt/xsser"
export PATH="$PATH:/opt/phan"
export PATH="$PATH:/opt/hostman"
export PATH="$PATH:/opt/apktool"
export PATH="$PATH:/opt/ttygif/bin"
export PATH="$PATH:/opt/hexedit/bin"
export PATH="$PATH:/opt/xarchiver/bin"
export PATH="$PATH:/opt/phantomjs/bin"
export PATH="$PATH:/opt/casperjs/bin"
export PATH="$PATH:/opt/charlesproxy/bin"
export PATH="$PATH:/opt/geoloc/bin"
export PATH="$PATH:/opt/heroku/bin"
export PATH="$PATH:/opt/ncftp/bin"
export PATH="$PATH:/opt/lnav"
export PATH="$PATH:/opt/nwjs"
export PATH="$PATH:/opt/iographica" # http://iographica.com/
export PATH="$PATH:/opt/yuicompressor" # https://github.com/yui/yuicompressor
export PATH="$PATH:/opt/wkhtmltox/bin" # http://wkhtmltopdf.org/

# Database Engines
export PATH="$PATH:/opt/redis/bin"
export PATH="$PATH:/opt/postgresql/bin"
export PATH="$PATH:/opt/mongodb/bin"
export PATH="$PATH:/opt/mysql/bin"
export PATH="$PATH:/opt/sqlite/bin"

# Web Server and Performance
export PATH="$PATH:/opt/apache/bin"
export PATH="$PATH:/opt/nginx/sbin"
export PATH="$PATH:/opt/varnish/bin"
export PATH="$PATH:/opt/memcached/bin"
export PATH="$PATH:/opt/prax/bin"

# HashiCorp: app development, delivery, and maintenance
export PATH="$PATH:/opt/hashicorp/otto"
export PATH="$PATH:/opt/hashicorp/nomad"
export PATH="$PATH:/opt/hashicorp/vault"
export PATH="$PATH:/opt/hashicorp/consul"
export PATH="$PATH:/opt/hashicorp/packer"
export PATH="$PATH:/opt/hashicorp/serfdom"
export PATH="$PATH:/opt/hashicorp/terraform"
export PATH="$PATH:/opt/hashicorp/vagrant/bin"

# Include private additional settings.
if [[ -e "$HOME/.bash_private" ]]; then
    source "$HOME/.bash_private"
fi

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

# Get the public IP address of the current Internet connection
alias myip='dig +short myip.opendns.com @resolver1.opendns.com'

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

# List top ten largest files/directories in current directory
alias ducks='du -cks * | sort -rn | head -11'

# Identify and search for active network connections
alias spy='lsof -i -P +c 0 +M'

# Identify what ports are open on the computer
alias tulpan='netstat -tulpan'

# Visualise git log (like gitk, in the terminal)
alias gitgraph='git log --graph --full-history --all --color --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s"'

# Rotate string thirteen positions
alias rot13="tr '[A-Za-z]' '[N-ZA-Mn-za-m]'"

# Download YouTube video and extract audio
alias mp3dl="youtube-dl --extract-audio --audio-format mp3 --audio-quality 0"

# Kill stressed running process.
function killproc() {
    if [[ "$1" == "" ]]; then
        echo "Usage: killproc [process]"
        return 2
    else
        PIDS=($(pgrep "$1"))
        for PID in "${PIDS[@]}"; do
            echo -n "- Killing ${PID} "
            skill -kill "$PID"
            if [[ "$?" -eq 0 ]]; then
                echo -e "\e[0;92m\u2714\e[0m"
            else
                echo -e "\e[0;91m\u2718\e[0m"
            fi
        done
    fi
}

# Kill stressed file manager.
function killcaja() {
    killproc "caja"
}

# Display version number of shared libraries.
function soname() {
    readelf -d "$1" | grep SONAME 2> /dev/null
    ldd "$1" 2> /dev/null
}

# Sudo for special host file manager actions.
# https://github.com/cixtor/hostman
function hostman() {
    if $(echo "$@" | grep -qE -- '-add|-disable|-enable|-remove'); then
        sudo env "PATH=$PATH" /opt/hostman/hostman $@
    else
        /opt/hostman/hostman $@
    fi
}

# Alias for the text-to-speech engine
function say() { echo "$@" | espeak -s 150 2>/dev/null; }

# Cut a string at certain length and return
function substr() { cut -c1-$1; }

# Rudimentary password manager
function pwmanager() {
    output="/tmp/passwords.txt"
    storage="$HOME/passwords.dat"
    echo "Exporting to ${output}"
    openssl enc -aes-256-cbc -d -in "$storage" -out "$output"
    /usr/bin/vim -- "$output"
    rm -fv -- "$output"
}

# Monitor and notify abount directory changes.
function inotifymake() {
    if $(command -v inotifywait &> /dev/null); then
        DIRECTORY=$(pwd)
        while inotifywait -r -e modify --format='%w%f' "$DIRECTORY"; do
            if [ "$1" != "" ]; then eval "$@"; fi
            notify-send "Inotify Make" \
            "Directory $DIRECTORY has changed" \
            --icon="dialog-information" \
            --expire-time=2000
        done
    else
        echo "apt-get install inotify-tools"
        return 1
    fi
}

# Switch between multiple development stacks
function newstack() {
    if [[ "$1" == "" ]]; then
        echo "Usage: newstack [stack_version]"
        return 2
    else
        target="/opt/devstack"
        expected="/opt/_devstack_${1}"
        if [[ -e "$expected" ]]; then
            if $(file -- "$target" | grep -q "symbolic link"); then
                rm -f -- "$target" 2> /dev/null
                ln -s "$expected" "$target"
                $(which php) --version
                return 0
            else
                echo "Target must be a symlink: ${target}"
                return 1
            fi
        else
            echo "Stack does not exists: ${expected}"
            return 1
        fi
    fi
}

# Shutdown VirtualBox network interfaces
function vboxdown() {
    VBoxManage hostonlyif remove vboxnet1
    VBoxManage hostonlyif remove vboxnet0
}

# Start Apache web server, MySQL, and MailCatcher
function startlamp() {
    sudo /opt/devstack/ctlscript.sh start apache
    /opt/devstack/ctlscript.sh start mysql
    if $(command -v mailcatcher &> /dev/null); then
        mailcatcher --ip 127.0.0.1 --smtp-port 1025 --http-port 1080
    fi
}

# Shutdown Apache web server and MailCatcher
function stoplamp() {
    sudo /opt/devstack/ctlscript.sh stop apache
    /opt/devstack/ctlscript.sh stop mysql
    curl -X DELETE 'http://127.0.0.1:1080/' 2> /dev/null
}

# Execute PHPUnit with smart test suite detection.
function phpunit() {
    phpbin=$(which phpunit)
    echo "$@" | grep -q -- '^--filter .*::.*'
    if [[ "$?" -eq 0 ]]; then
        params="$@" # Get original command arguments.
        params=$(echo "$params" | sed 's;--filter ;tests/;g')
        params=$(echo "$params" | sed 's;::;\.php --filter ;')
        eval "$phpbin $params"
    else
        $phpbin "$@"
    fi
}

# Execute custom PHPCode_Sniffer coding standard.
function psr2() {
    ruleset=''
    ruleset+='<?xml version="1.0"?>'
    ruleset+='<ruleset name="PSR99">'
    ruleset+='  <description>PSR2 without some unnecessary rules.</description>'
    ruleset+='  <rule ref="PSR2">'
    ruleset+='    <exclude name="Generic.Files.LineLength"/>'
    ruleset+='    <exclude name="PSR1.Classes.ClassDeclaration.MissingNamespace" />'
    ruleset+='    <exclude name="PSR1.Files.SideEffects.FoundWithSymbols" />'
    ruleset+='  </rule>'
    ruleset+='  <rule ref="Internal.NoCodeFound">'
    ruleset+='    <severity>0</severity>'
    ruleset+='  </rule>'
    ruleset+='</ruleset>'
    standard="$HOME/.psr99.xml"

    if [[ ! -e "$standard" ]]; then
        echo "$ruleset" 1> "$standard"
    fi

    $(which phpcs) -w -l \
    --standard="$standard" \
    --report-width=150 \
    --report=full \
    --colors "$@"
}

function commit() {
    if [[ "$4" == "" ]]; then
        echo "Usage: commit -m <message> -d yyyy-mm-dd"
        return 2
    else
        message="false"
        comdate="false"

        if [[ "$1" == "-m" ]] && [[ "$3" == "-d" ]]; then
            message="$2"
            comdate="$4"
        elif [[ "$1" == "-d" ]] && [[ "$3" == "-m" ]]; then
            message="$4"
            comdate="$2"
        fi

        if [[ "$message" == "false" || "$comdate" == "false" ]]; then
            echo "Invalid options"
            return 1
        else
            comdate="${comdate}T09:00:00"
            export GIT_AUTHOR_DATE="$comdate"
            export GIT_COMMITTER_DATE="$comdate"
            git commit --message="$message" --date="$comdate"
        fi
    fi
}

# Format user group list
function id() {
    if [[ "$@" == "" ]]; then
        IFS=$','
        for item in $(/usr/bin/id); do
            echo "- ${item}"
        done
    else
        /usr/bin/id "$@"
    fi
}

# Prettify the output of the Git log command.
function git() {
    if [[ "$@" == "log" ]]; then
        $(which git) log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit
    else
        $(which git) "$@"
    fi
}

# Calculate Mercurial ahead and behind commits
#
# b_sw3jdurr   3965:7f2a83ffc61d
# b_le3g3mfe   3946:b03737187a81 (inactive) ▏                19
# b_kan3g0ij   3936:8d3c665602e5 (inactive) ▎                29
# b_x0lctp54   3891:fbee645a2f0c (inactive) ▊                74
# b_ebo3bxj4   3460:fedb88847071 (inactive) █████▊           505
# b_i86f5qln   3182:2b132fa69174 (inactive) ████████▉        783
# b_0tvihibs   3065:c3bff4489ee1 (inactive) ██████████▍      900
# b_iuifnik4   3003:2d633479b952 (inactive) ███████████      962
# b_d0vkqfv0   2972:d205390198c6 (inactive) ███████████▎     993
# b_llslwq8z   2922:a21134e2940d (inactive) ████████████     1043
# b_n3gmq5yz   2581:c1a2afe566a4 (inactive) ████████████████ 1384
function hg() {
    if [[ "$@" == "branches" ]]; then
        script="/tmp/hg-branches-$(date +%s).py"
        code='' # Base64-encoded Python script
        code+='IyEvdXNyL2Jpbi9lbnYgcHl0aG9uCiMgLSotIGNvZGluZzogdXRmLTggLSotCmltcG9ydCBzdWJw'
        code+='cm9jZXNzLCByZQoKcHJvYyA9IHN1YnByb2Nlc3MuUG9wZW4oWyJoZyBicmFuY2hlcyAtLWNsb3Nl'
        code+='ZCAtLWNvbG9yPW5ldmVyIl0sCiAgICBzdGRvdXQ9c3VicHJvY2Vzcy5QSVBFLAogICAgc2hlbGw9'
        code+='VHJ1ZSkKKG91dHB1dCwgZXJyb3IpID0gcHJvYy5jb21tdW5pY2F0ZSgpCgppZiBlcnJvciA9PSBO'
        code+='b25lOgogICAgbGluZXMgPSBvdXRwdXQuc3BsaXQoJ1xuJykKICAgIChicmFuY2hlcywgaGVhZHMs'
        code+='IGNvbW1pdHMpID0gKFtdLCBbXSwgW10pCiAgICBzcGFya3MgPSBbCiAgICAgICAgdSJcdTAwMjAi'
        code+='LCAjIHNwYWNlCiAgICAgICAgdSJcdTI1OEYiLCAjIOKWjwogICAgICAgIHUiXHUyNThFIiwgIyDi'
        code+='lo4KICAgICAgICB1Ilx1MjU4RCIsICMg4paNCiAgICAgICAgdSJcdTI1OEMiLCAjIOKWjAogICAg'
        code+='ICAgIHUiXHUyNThCIiwgIyDilosKICAgICAgICB1Ilx1MjU4QSIsICMg4paKCiAgICAgICAgdSJc'
        code+='dTI1ODkiLCAjIOKWiQogICAgICAgIHUiXHUyNTg4IiwgIyDilogKICAgIF0KCiAgICBmb3IgbGlu'
        code+='ZSBpbiBsaW5lczoKICAgICAgICBpZiBsaW5lICE9ICIiOgogICAgICAgICAgICBtYXRjaCA9IHJl'
        code+='LnNlYXJjaCgnKFxTKylccysoXGQrKTooWzAtOWEtel17MTJ9KScsIGxpbmUpCgogICAgICAgICAg'
        code+='ICBpZiBtYXRjaCAhPSBOb25lOgogICAgICAgICAgICAgICAgYnJhbmNoZXMuYXBwZW5kKG1hdGNo'
        code+='Lmdyb3VwKDEpKQogICAgICAgICAgICAgICAgY29tbWl0cy5hcHBlbmQobWF0Y2guZ3JvdXAoMykp'
        code+='CiAgICAgICAgICAgICAgICBoZWFkcy5hcHBlbmQoaW50KG1hdGNoLmdyb3VwKDIpKSkKCiAgICBj'
        code+='b3VudGVyID0gMAogICAgYnNwYXJrcyA9IFtdCiAgICBncmVhdGVzdCA9IG1heChoZWFkcykKICAg'
        code+='IHBlcmNoYXIgPSA4ICMgTWF4aW11bSBzcGFyayBiYXJzIHBlciBjaGFyYWN0ZXIKICAgIG1heGlt'
        code+='dW0gPSAxNiAjIE1heGltdW0gY2hhcmFjdGVycyBmb3IgMTAwJQogICAgbWF4MTAwcCA9IHBlcmNo'
        code+='YXIgKiBtYXhpbXVtCiAgICBkaWZmcyA9IFsoZ3JlYXRlc3QgLSBoZWFkKSBmb3IgaGVhZCBpbiBo'
        code+='ZWFkc10KICAgIG1heF9kaWZmID0gbWF4KGRpZmZzKQogICAgcmVhbF9wMTAwID0gWygoZGlmZiAq'
        code+='IDEwMCkgLyBtYXhfZGlmZikgZm9yIGRpZmYgaW4gZGlmZnNdOwogICAgZmFrZV9wMTAwID0gWygo'
        code+='cCAqIG1heDEwMHApIC8gMTAwKSBmb3IgcCBpbiByZWFsX3AxMDBdCgogICAgZm9yIGZha2UgaW4g'
        code+='ZmFrZV9wMTAwOgogICAgICAgIHVuaXRzID0gKGZha2UgLyAocGVyY2hhciAqIDEuMCkpCiAgICAg'
        code+='ICAgc3VlbG8gPSBpbnQodW5pdHMpCiAgICAgICAgaWYgKHVuaXRzID09IHN1ZWxvKToKICAgICAg'
        code+='ICAgICAgYnNwYXJrcy5hcHBlbmQodSJcdTI1ODgiICogc3VlbG8pCiAgICAgICAgZWxzZToKICAg'
        code+='ICAgICAgICAgcmVzdCA9IGZha2UgLSAoc3VlbG8gKiBwZXJjaGFyKQogICAgICAgICAgICBmaXJz'
        code+='dCA9ICh1Ilx1MjU4OCIgKiBzdWVsbykKICAgICAgICAgICAgdHJhaWxpbmcgPSBzcGFya3NbcmVz'
        code+='dF0KICAgICAgICAgICAgYnNwYXJrcy5hcHBlbmQoZmlyc3QgKyB0cmFpbGluZykKCiAgICBmb3Ig'
        code+='aGVhZCBpbiBoZWFkczoKICAgICAgICBkaWZmID0gKGdyZWF0ZXN0IC0gaGVhZCkKICAgICAgICBp'
        code+='ZiBjb3VudGVyID09IDA6CiAgICAgICAgICAgIHByaW50IGxpbmVzW2NvdW50ZXJdCiAgICAgICAg'
        code+='ZWxzZToKICAgICAgICAgICAgd2hpdGViYXIgPSBic3BhcmtzW2NvdW50ZXJdLmxqdXN0KG1heGlt'
        code+='dW0pCiAgICAgICAgICAgIHByaW50IGxpbmVzW2NvdW50ZXJdLCB3aGl0ZWJhciwgZGlmZgogICAg'
        code+='ICAgIGNvdW50ZXIgKz0gMQplbHNlOgogICAgcHJpbnQgIkVycm9yOiAiLCBlcnJvcgo='
        echo "$code" | base64 -d 1> $script
        if [[ -e "$script" ]]; then
            /usr/bin/env python -- "$script"
            rm -f -- "$script" 2> /dev/null
        else
            $(which hg) "branches"
        fi
    else
        $(which hg) "$@"
    fi
}

# Statistics of the eth0 bandwidth consumption
function eth0stats() {
    # apt-get install vnstat vnstati
    rm -f /tmp/vnstati-*.png 2> /dev/null
    output="/tmp/vnstati-$(date +%s).png"
    vnstati -i eth0 -d -o "$output"
    xdg-open "$output" &> /dev/null
}

# Statistics of the wlan0 bandwidth consumption
function wlan0stats() {
    # apt-get install vnstat vnstati
    rm -f /tmp/vnstati-*.png 2> /dev/null
    output="/tmp/vnstati-$(date +%s).png"
    vnstati -i wlan0 -d -o "$output"
    xdg-open "$output" &> /dev/null
}

# Disguise CURL as a normal web browser
function agent() {
    curl -H 'DNT: 1' \
    -H 'Pragma: no-cache' \
    -H 'Upgrade-Insecure-Requests: 1' \
    -H 'Accept-Language: en-US,en;q=0.8' \
    -H 'Accept-Encoding: gzip, deflate, sdch, br' \
    -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' \
    -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.54 Safari/537.36' \
    -H 'Cache-Control: no-cache' \
    -H 'Connection: keep-alive' \
    --compressed "$@"
}

# Disguise CURL as the Google web crawler.
function googlebot() {
    curl -H 'DNT: 1' \
    -H 'Upgrade-Insecure-Requests: 1' \
    -H 'Accept-Encoding: gzip, deflate' \
    -H 'Accept-Language: en-US,en;q=0.8' \
    -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' \
    -H 'User-Agent: Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)' \
    --compressed "$@"
}

# Lint CSS files ignoring some rules.
function csslint() {
    if $(command -v csslint &> /dev/null); then
        $(which csslint) --format=compact --ignore=adjoining-classes,box-sizing,box-model,ids "$@"
    else
        echo "npm install -g csslint"
        return 1
    fi
}

# Extract most known archives with one command
function extract() {
    if [ -f $1 ]; then
        case $1 in
            *.tar.bz2) tar xjf $1    ;;
            *.tar.gz)  tar xzf $1    ;;
            *.bz2)     bunzip2 $1    ;;
            *.rar)     unrar e $1    ;;
            *.gz)      gunzip $1     ;;
            *.tar)     tar xf $1     ;;
            *.tbz2)    tar xjf $1    ;;
            *.tgz)     tar xzf $1    ;;
            *.zip)     unzip $1      ;;
            *.Z)       uncompress $1 ;;
            *.7z)      7z x $1       ;;
            *)         echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# Create a new profile for mate-terminal with Monokai colors
function install_mate_monokai_terminal() {
    PROFILE_SLUG="monokai-dark"
    PROFILE_NAME="Monokai Dark"
    PROFILE_BOLD="#f8f8f2"
    PROFILE_BGROUND="#272822"
    PROFILE_FGROUND="#f8f8f2"
    PROFILE_FONT="Menlo for Powerline 8"
    PROFILE_PALETTE="#272822:#f92672:#a6e22e:#f4bf75"
    PROFILE_PALETTE+=":#66d9ef:#ae81ff:#a1efe4:#f8f8f2"
    PROFILE_PALETTE+=":#75715e:#f92672:#a6e22e:#f4bf75"
    PROFILE_PALETTE+=":#66d9ef:#ae81ff:#a1efe4:#f9f8f5"
    PROFILE_KEY="/org/mate/terminal/profiles/${PROFILE_SLUG}"
    PROFILE_LIST="/org/mate/terminal/global/profile-list"

    command -v dconf 1> /dev/null

    if [[ "$?" -ne 0 ]]; then
        echo "Install gvariant database manager"
        echo "apt-get install dconf-cli"
        exit 1
    fi

    profiles=$(dconf read "$PROFILE_LIST")
    echo "$profiles" | grep -q "$PROFILE_SLUG"
    if [[ "$?" -eq 1 ]]; then
        profiles=$(echo "$profiles" | sed "s;];, '${PROFILE_SLUG}'];")
        dconf write "$PROFILE_LIST" "${profiles}"
    fi

    # Set specific values for the selected theme.
    dconf write "${PROFILE_KEY}/visible-name" "'${PROFILE_NAME}'"
    dconf write "${PROFILE_KEY}/background-color" "'${PROFILE_BGROUND}'"
    dconf write "${PROFILE_KEY}/foreground-color" "'${PROFILE_FGROUND}'"
    dconf write "${PROFILE_KEY}/bold-color" "'${PROFILE_BOLD}'"
    dconf write "${PROFILE_KEY}/palette" "'${PROFILE_PALETTE}'"
    dconf write "${PROFILE_KEY}/font" "'${PROFILE_FONT}'"
    dconf write "${PROFILE_KEY}/use-theme-background" "false"
    dconf write "${PROFILE_KEY}/bold-color-same-as-fg" "true"
    dconf write "${PROFILE_KEY}/use-system-font" "false"
    dconf write "${PROFILE_KEY}/allow-bold" "true"

    # Set default window and buffer size.
    dconf write "${PROFILE_KEY}/use-custom-default-size" "true"
    dconf write "${PROFILE_KEY}/default-size-columns" "116"
    dconf write "${PROFILE_KEY}/default-size-rows" "32"

    # Set window scroll behavior.
    dconf write "${PROFILE_KEY}/scrollback-lines" "1"
    dconf write "${PROFILE_KEY}/scrollback-unlimited" "true"
    dconf write "${PROFILE_KEY}/scrollbar-position" "'right'"
    dconf write "${PROFILE_KEY}/scroll-on-keystroke" "true"
    dconf write "${PROFILE_KEY}/scroll-on-output" "false"
    dconf write "${PROFILE_KEY}/scroll-background" "true"

    dconf write "${PROFILE_KEY}/background-type" "'solid'"
    dconf write "${PROFILE_KEY}/cursor-blink-mode" "'system'"
    dconf write "${PROFILE_KEY}/cursor-shape" "'block'"
    dconf write "${PROFILE_KEY}/default-show-menubar" "false"
    dconf write "${PROFILE_KEY}/use-theme-colors" "false"
}

# Check reddit username availability
function redditnick() {
    curl 'https://www.reddit.com/api/check_username.json' \
    -H 'Accept-Language: en-US,en;q=0.8' \
    -H 'Accept-Encoding: gzip, deflate, br' \
    -H 'Accept: application/json, text/javascript, */*; q=0.01' \
    -H 'User-Agent: Mozilla/5.0 (KHTML, like Gecko) Safari/537.36' \
    -H 'Content-Type: application/x-www-form-urlencoded; charset=UTF-8' \
    -H 'X-Requested-With: XMLHttpRequest' \
    -H 'Referer: https://www.reddit.com/' \
    -H 'Origin: https://www.reddit.com' \
    -H 'Connection: keep-alive' \
    --data "user=${1}" \
    --compressed --silent | python -m json.tool
}

# Unshorten a shortened URL.
function unshorten() {
    encoded_url=$(strconv -urlenc -text "$1")
    csrftoken=$(genpasswd -type 1Aa -length 32)
    response=$(
        curl -H 'DNT: 1' \
        -H "Connection: keep-alive" \
        -H "Origin: http://unshorten.it" \
        -H "Referer: http://unshorten.it/" \
        -H "Accept-Encoding: gzip, deflate" \
        -H "X-Requested-With: XMLHttpRequest" \
        -H "Cookie: csrftoken=${csrftoken}" \
        -H "User-Agent: Mozilla/5.0 (KHTML, like Gecko) Safari/537.36" \
        -H "Content-Type: application/x-www-form-urlencoded; charset=UTF-8" \
        --url "http://unshorten.it/main/get_long_url" \
        --data "short-url=${encoded_url}" \
        --data "csrfmiddlewaretoken=${csrftoken}" \
        --compressed --silent
    )
    result=$(echo "$response" | python -m json.tool)
    if [[ "$?" -eq 0 ]]; then echo "$result"; else echo "$response"; fi
}

# Download media files from OpenGraph video tags.
function ogvideodl() {
    echo "@ $1"
    response=$(
        curl -H 'dnt: 1' \
        -H 'Connection: keep-alive' \
        -H 'Cache-Control: max-age=0' \
        -H 'Accept-Language: en-US,en;q=0.5' \
        -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8' \
        -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:46.0) Gecko/20100101 Firefox/46.0' \
        --compressed --silent "$1"
    )

    ogtag=$(echo "$response" | grep '"og:video"')

    if [[ "$ogtag" == "" ]]; then
        echo "No OpenGraph video tag"
        return 1
    else
        url=$(echo "$ogtag" | sed 's;.*content=";;' | cut -d '"' -f 1)
        filename=$(echo "$url" | rev | cut -d '/' -f 1 | rev)

        echo "  ${url}"
        echo "  ${filename}"
        curl -H 'dnt: 1' \
        -H 'Connection: keep-alive' \
        -H 'Cache-Control: max-age=0' \
        -H 'Accept-Language: en-US,en;q=0.5' \
        -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8' \
        -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:46.0) Gecko/20100101 Firefox/46.0' \
        --compressed --output "$filename" "$url"

        if [[ "$?" -eq 0 ]]; then
            notify-send "OpenGraph Video Download" "$url" -i "dialog-information"
            return 0
        else
            notify-send "OpenGraph Video Download" "$url" -i "dialog-error"
            return 1
        fi
    fi
}
