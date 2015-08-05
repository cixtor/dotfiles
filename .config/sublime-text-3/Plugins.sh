#!/bin/bash
inst_path="$HOME/.config/sublime-text-3/Packages/"
repositories=(
    "Vala|technosophos/Vala-TMBundle"
    "GoSublime|DisposaBoy/GoSublime"
    "DocBlockr|spadgos/sublime-jsdocs"
    "Codec|furikake/sublime-codec"
    "AdvancedNewFile|skuroda/Sublime-AdvancedNewFile"
    "Alignment|wbond/sublime_alignment"
    "PlainTasks|aziz/PlainTasks"
    "knockdown|aziz/knockdown"
    "CoffeeScript|jashkenas/coffee-script-tmbundle"
    "LaravelBlade|Medalink/laravel-blade"
)
if [ -e "${inst_path}" ]; then
    cd $inst_path
    for repo in "${repositories[@]}"; do
        local_name=$(echo $repo | awk -F '|' '{print $1}')
        repo_name=$(echo $repo | awk -F '|' '{print $2}')
        repo_url="https://github.com/${repo_name}"
        echo -e "Install '\e[0;33m${repo_name}\e[0m' as '\e[0;32m${local_name}\e[0m'"
        git clone "${repo_url}" "${local_name}"
        echo
    done
fi
