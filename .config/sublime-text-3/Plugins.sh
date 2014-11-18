#!/bin/bash
inst_path="$HOME/.config/sublime-text-3/Packages/"
repositories=(
    "skuroda/Sublime-AdvancedNewFile AdvancedNewFile"
    "wbond/sublime_alignment Alignment"
    "spadgos/sublime-jsdocs DocBlockr"
    "Medalink/laravel-blade LaravelBlade"
    "aziz/PlainTasks PlainTasks"
    "aziz/knockdown knockdown"
    "technosophos/Vala-TMBundle Vala"
    "jashkenas/coffee-script-tmbundle CoffeeScript"
)
if [ -e "${inst_path}" ]; then
    cd $inst_path
    for repo in "${repositories[@]}"; do
        repo_name=$(echo $repo | awk '{print $1}')
        repo_url="https://github.com/${repo_name}"
        local_name=$(echo $repo | awk '{print $2}')
        echo -e "Install '\e[0;33m${repo_name}\e[0m' as '\e[0;32m${local_name}\e[0m'"
        git clone "${repo_url}" "${local_name}"
        echo
    done
fi
