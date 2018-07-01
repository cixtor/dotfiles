#!/bin/bash
SYSTEM=$(uname -s)
INST_PATH="$HOME/.config/sublime-text-3/Packages/"
REPOSITORIES=(
    "Alignment|wbond/sublime_alignment"
    "CaseConversion|jdc0589/CaseConversion"
    "ClangFormat|rosshemsley/SublimeClangFormat"
    "Codec|furikake/sublime-codec"
    "DocBlockr|spadgos/sublime-jsdocs"
    "INI|clintberry/sublime-text-2-ini"
    "LSP|tomv564/LSP"
    "PlainTasks|aziz/PlainTasks"
    "Rust-Enhanced|rust-lang/rust-enhanced"
    "SublimeLinter|SublimeLinter/SublimeLinter"
    "SublimeLinter-eslint|SublimeLinter/SublimeLinter-eslint"
    "SublimeLinter-gometalinter|alecthomas/SublimeLinter-contrib-gometalinter"
    "SublimeLinter-php|SublimeLinter/SublimeLinter-php"
    "SublimeLinter-phpcs|SublimeLinter/SublimeLinter-phpcs"
    "SublimeLinter-rubocop|SublimeLinter/SublimeLinter-rubocop"
    "SublimeLinter-shellcheck|SublimeLinter/SublimeLinter-shellcheck"
    "SublimeLinter-stylelint|kungfusheep/SublimeLinter-contrib-stylelint"
    "SublimeLinter-swiftlint|mailiam/SublimeLinter-contrib-swiftlint"
    "SublimeOnSaveBuild|alexnj/SublimeOnSaveBuild"
    "Swift|quiqueg/Swift-Sublime-Package"
    "Vala|technosophos/Vala-TMBundle"
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
