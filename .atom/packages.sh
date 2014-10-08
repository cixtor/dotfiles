#!/bin/bash
inst_path="$HOME/.atom/packages/"
repositories=(
    "thomaslindstrom/color-picker color-picker"
    "DanBrooker/file-icons file-icons"
    "kevinsawicki/monokai monokai"
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
