#!/bin/bash
SYSTEM=$(uname -s)
INST_PATH="$HOME/.config/sublime-text-3/Packages/"
REPOSITORIES=(
    "Vala|technosophos/Vala-TMBundle"
    "GoSublime|DisposaBoy/GoSublime"
    "CPP11|noct/sublime-cpp11"
    "ClangFormat|rosshemsley/SublimeClangFormat"
    "Clang-Complete|lvzixun/Clang-Complete"
    "Rust|rust-lang/sublime-rust"
    "DocBlockr|spadgos/sublime-jsdocs"
    "Codec|furikake/sublime-codec"
    "Alignment|wbond/sublime_alignment"
    "PlainTasks|aziz/PlainTasks"
    "MarkdownLight|sekogan/MarkdownLight"
    "CaseConversion|jdc0589/CaseConversion"
    "SublimeLinter|SublimeLinter/SublimeLinter3"
    "SublimeLinter-php|SublimeLinter/SublimeLinter-php"
    "SublimeLinter-phpcs|SublimeLinter/SublimeLinter-phpcs"
    "SublimeLinter-jshint|SublimeLinter/SublimeLinter-jshint"
    "SublimeLinter-shellcheck|SublimeLinter/SublimeLinter-shellcheck"
    "SublimeLinter-stylelint|kungfusheep/SublimeLinter-contrib-stylelint"
    "SublimeLinter-gometalinter|alecthomas/SublimeLinter-contrib-gometalinter"
)

if [[ "$SYSTEM" == "Darwin" ]]; then
    INST_PATH="$HOME/Library/Application Support/Sublime Text 3/Packages/"
fi

if [[ -e "${INST_PATH}" ]]; then
    cd "$INST_PATH" || exit

    for REPO in "${REPOSITORIES[@]}"; do
        LOCAL_NAME=$(echo "$REPO" | awk -F '|' '{print $1}')
        REPO_NAME=$(echo "$REPO" | awk -F '|' '{print $2}')
        REPO_URL="https://github.com/${REPO_NAME}"
        echo "Installing ${REPO_URL}"
        git clone "${REPO_URL}" "${LOCAL_NAME}"
        echo
    done
fi
