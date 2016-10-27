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

# Set version control system commit editor.
export EDITOR=vim
export GIT_EDITOR=vim
export HGEDITOR=vim

# GoLang - http://golang.org/
# https://golang.org/doc/install
# https://golang.org/pkg/#stdlib
# https://golang.org/doc/articles/race_detector.html
export GOROOT="/opt/golang/build"
export GOPATH="/opt/golang/gopath"
export GORACE="log_path=stderr exitcode=66"
export PATH="$PATH:$GOROOT/bin"
export PATH="$PATH:$GOPATH/bin"

# Protobuf - Google's data interchange format
# https://developers.google.com/protocol-buffers/
# https://github.com/google/protobuf
export PATH="$PATH:/opt/protobuf/bin"

# Rust - https://www.rust-lang.org/
export RUST_SRC_PATH="/opt/rustlang/source/src/"
export PATH="$PATH:/opt/rustlang/packages/bin"
export PATH="$PATH:/opt/rustlang/bin"
export PATH="$PATH:$HOME/.cargo/bin"

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
export PATH="$PATH:/opt/nmap/bin" # https://nmap.org/
export PATH="$PATH:/opt/pfff/bin" # https://github.com/facebook/pfff
export PATH="$PATH:/opt/siege" # https://github.com/JoeDog/siege
export PATH="$PATH:/opt/xsser" # https://xsser.03c8.net/
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
export PATH="$PATH:/opt/ipfs" # https://ipfs.io/
export PATH="$PATH:/opt/vegeta/bin" # https://github.com/tsenart/vegeta

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

# Print generic default date based on Go.
alias ansic="echo 'Mon Jan _2 15:04:05 2006 - 1136239445'"

# Get the public IP address of the current Internet connection
alias myip='dig +short myip.opendns.com @resolver1.opendns.com'

# Get the local IP address of all the network nodes.
function mylocalip() {
    index=0
    names=($(ifconfig | grep 'Link encap' | awk '{print $1}'))
    ips=($(ifconfig | grep inet | grep -v inet6 | awk '{print $2}'))
    for name in "${names[@]}"; do
        address=$(echo "${ips[index]}" | sed 's/addr://')
        if [[ "$address" == "" ]]; then address="none"; fi
        echo "${name}: ${address}"
        index=$(( index + 1 ))
    done
}

# Perform a rotation on a string by the value specified
function rotate() {
    # Positions to shift the text in the alphabet
    position=$([[ "$2" == "" ]] && echo "13" || echo "$2")
    strconv -rotate -text "$1" -num "$position"
}

# Replace a text string with another
function replace() {
    # new: Text string that will replace the old one
    # old: Text string that will be replaced
    strconv -replace -text "$1" -old "$2" -new "$3"
}

# List top ten largest files/directories in current directory
alias ducks='du -cks * | sort -rn | head -11'

# Identify and search for active network connections
alias spy='lsof -i -P +c 0 +M'

# Identify what ports are open on the computer
alias tulpan='netstat -tulpan'

# Visualise git log (like gitk, in the terminal)
alias gitgraph='git log --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'

# Rotate string thirteen positions
alias rot13="tr '[A-Za-z]' '[N-ZA-Mn-za-m]'"

# Download YouTube video and extract audio
alias mp3dl="youtube-dl --extract-audio --audio-format mp3 --audio-quality 0"

# Subresource Integrity
#
# https://www.srihash.org/
# https://developer.mozilla.org/en-US/docs/Web/Security/Subresource_Integrity
#
# Subresource Integrity (SRI) is a security feature that enables browsers to
# verify that files they fetch (for example, from a CDN) are delivered without
# unexpected manipulation. It works by allowing you to provide a cryptographic
# hash that a fetched file must match.
function srihash() {
    if [[ -e "$1" ]]; then DATA=$(cat -- "$1"); else DATA=$(curl "$1" -s); fi
    RESP=$(echo -n "$DATA" | openssl dgst -sha384 -binary | openssl enc -base64 -A)
    echo "sha384-${RESP}"
}

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

function man() {
    LESS_TERMCAP_mb=$'\e'"[1;31m" \
    LESS_TERMCAP_md=$'\e'"[1;31m" \
    LESS_TERMCAP_me=$'\e'"[0m" \
    LESS_TERMCAP_se=$'\e'"[0m" \
    LESS_TERMCAP_so=$'\e'"[1;44;33m" \
    LESS_TERMCAP_ue=$'\e'"[0m" \
    LESS_TERMCAP_us=$'\e'"[1;32m" \
    command man "$@"
}

# Sudo for special host file manager actions.
# https://github.com/cixtor/hostman
function hostman() {
    echo "$@" | grep -qE -- '-add|-disable|-enable|-remove'

    if [[ "$?" -eq 0 ]]; then
        sudo env "PATH=$PATH" /opt/hostman/hostman "$@"
    else
        /opt/hostman/hostman "$@"
    fi
}

function alert() {
    URGENCY=$([[ $? -eq 0 ]] && echo normal || echo critical)
    MESSAGE=$(history | tail -n1 | sed 's;^\s*[0-9]\+\s*;;')
    MESSAGE=$(echo "$MESSAGE" | sed 's/\s*[&;]\+\s*alert//')
    notify-send --urgency="$URGENCY" "$MESSAGE"
}

# Alias for the text-to-speech engine
function say() { echo "$@" | espeak -s 150 2>/dev/null; }

# Cut a string at certain length and return
function substr() { cut -c1-"$1"; }

# Generate a new set of SSH keys
# https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/
function sshkey() {
    if [[ "$1" == "" ]]; then
        echo "Usage: sshkey [email]"
        return 2
    fi

    ssh-keygen -t rsa -b 4096 -C "$1"
}

# Rudimentary password manager
function pwmanager() {
    output="/tmp/passwords.txt"
    storage="${HOME}/passwords.dat"
    echo "Exporting to ${output}"
    openssl enc -aes-256-cbc -d -in "$storage" -out "$output"
    if [[ "$?" -eq 0 ]]; then
        /usr/bin/vim -- "$output"
        rm -fv -- "$output"
    fi
}

# Display information about an SSL certificate.
function sslclient() {
    if [[ "$1" == "" ]]; then
        echo "Usage: sslclient [domain]"
        return 1
    else
        echo -n '' | openssl s_client -connect "${1}:443"
        return 0
    fi
}

# Monitor and notify abount directory changes.
function runonchange() {
    command -v inotifywait &> /dev/null
    if [[ "$?" -eq 0 ]]; then
        DIRECTORY=$(pwd)
        while inotifywait -r -e modify --format='%w%f' "$DIRECTORY"; do
            if [[ "$1" != "" ]]; then eval "$@"; fi
            URGENCY=$([[ $? -eq 0 ]] && echo normal || echo critical)
            SHORT_DIRECTORY="${DIRECTORY//$HOME/\~}"
            notify-send "Run On Change" \
            "Directory ${SHORT_DIRECTORY} has changed" \
            --urgency="$URGENCY" \
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
            file -- "$target" | grep -q "symbolic link"
            if [[ "$?" -eq 0 ]]; then
                rm -f -- "$target" 2> /dev/null
                ln -s "$expected" "$target"
                $(command -v php) --version 2> /dev/null
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

# Start Apache, Nginx, MySQL, and MailCatcher
function startlamp() {
    if [[ -e "/opt/devstack/apache2" ]]; then
        sudo /opt/devstack/ctlscript.sh start apache
    fi

    if [[ -e "/opt/devstack/hhvm" ]]; then
        sudo /opt/devstack/ctlscript.sh start hhvm
    fi

    if [[ -e "/opt/devstack/nginx" ]]; then
        sudo /opt/devstack/ctlscript.sh start nginx
        sudo /opt/devstack/ctlscript.sh start php-fpm
    fi

    if [[ -e "/opt/devstack/mysql" ]]; then
        /opt/devstack/ctlscript.sh start mysql
    fi

    if command -v mailcatcher &> /dev/null; then
        mailcatcher --ip 127.0.0.1 --smtp-port 1025 --http-port 1080
    fi
}

# Shutdown Apache, Nginx, MySQL, and MailCatcher
function stoplamp() {
    sudo /opt/devstack/ctlscript.sh stop apache
    sudo /opt/devstack/ctlscript.sh stop nginx
    sudo /opt/devstack/ctlscript.sh stop php-fpm
    sudo /opt/devstack/ctlscript.sh stop hhvm
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

# Report unused variables in the source code.
function phpvoidcode() {
    phpmd "$@" text unusedcode
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

function git() {
    echo "$@" | grep -q '^commit.* -d'

    if [[ "$?" -eq 0 ]]; then
        echo "$@" | grep -q '^commit .*-d ....-..-..'

        if [[ "$?" -eq 1 ]]; then
            echo "Usage: git commit -d yyyy-mm-dd"
            return 1
        fi

        options=$(echo "$@" | sed 's; -d .*;;')
        datetime=$(echo "$@" | sed 's;.*-d ;;')
        comdate="${datetime}T09:00:00"

        export GIT_AUTHOR_DATE="$comdate"
        export GIT_COMMITTER_DATE="$comdate"

        echo "[author] ${GIT_AUTHOR_DATE}"
        echo "[commit] ${GIT_COMMITTER_DATE}"

        $(which git) "$options"
    else
        $(which git) "$@"
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
        echo "$code" | base64 -d 1> "$script"
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
    -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2725.0 Safari/537.36' \
    -H 'Cache-Control: no-cache' \
    -H 'Connection: keep-alive' \
    --compressed "$@"
}

# HTTP request with malformed HTTP method.
function malformed() {
    curl -X 'FOOBAR / cixtor.com / HELLO " WORLD' \
    -H 'DNT: 1' \
    -H 'Pragma: no-cache' \
    -H 'Upgrade-Insecure-Requests: 1' \
    -H 'Accept-Language: en-US,en;q=0.8' \
    -H 'Accept-Encoding: gzip, deflate, sdch, br' \
    -H 'Accept: text/html,application/xhtml+xml,application/xml' \
    -H 'User-Agent: Mozilla"/"5.0 (KHTML, like Gecko) Safari/5"3"7"."3"6' \
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

# Install screencast recorder to GIF.
# apt install byzanz xdotool x11-utils libx11-dev
# https://github.com/syohex/byzanz-window
function win2gif() {
    command -v byzanz-record 1> /dev/null

    if [[ "$?" -eq 0 ]]; then
        byzanz-window "$@"
    else
        echo "Missing dependencies"
        echo "apt install byzanz xdotool x11-utils libx11-dev"
        echo "https://github.com/syohex/byzanz-window"
        return 1
    fi
}

# Lint CSS files ignoring some rules.
function csslint() {
    csslint_bin=$(which csslint 2> /dev/null)
    if [[ "$?" -eq 0 ]]; then
        rules="adjoining-classes,box-sizing,box-model,ids"
        "$csslint_bin" --format=compact --ignore="$rules" "$1"
    else
        echo "npm install -g csslint"
        return 1
    fi
}

# Extract most known archives with one command
function extract() {
    if [[ -f "$1" ]]; then
        case $1 in
            *.tar.bz2) tar xjf "$1"    ;;
            *.tar.gz)  tar xzf "$1"    ;;
            *.bz2)     bunzip2 "$1"    ;;
            *.rar)     unrar e "$1"    ;;
            *.gz)      gunzip "$1"     ;;
            *.tar)     tar xf "$1"     ;;
            *.tbz2)    tar xjf "$1"    ;;
            *.tgz)     tar xzf "$1"    ;;
            *.zip)     unzip "$1"      ;;
            *.Z)       uncompress "$1" ;;
            *.7z)      7z x "$1"       ;;
            *)         echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# Get top one million domains from Alexa.
function tld1m() {
    wget "http://s3.amazonaws.com/alexa-static/top-1m.csv.zip" \
    --user-agent="Mozilla/5.0 (KHTML, like Gecko) Safari/537.36" \
    --output-document="top-1m.csv-$(date +%s).zip"
}

# Starts a chronometer in the terminal.
function chronometer() {
    while true; do
        date && sleep 1
    done
}

# Print some (useful?) emoticons.
function shrug() {
    echo "¯\_(ツ)_/¯"
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
    response=$(
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
    --compressed --silent
    )
    if [[ "$response" == "{}" ]]; then
        echo "${1} is available"
        return 0
    else
        echo "$response"
        return 1
    fi
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
