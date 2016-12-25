#!/bin/bash
if [[ "$1" == "" ]]; then
    S=$(echo "$0" | rev | cut -d/ -f1 | rev)
    echo "Usage: $S [query]"
    exit 1
fi

QUERY="${1:-foobar}"
echo "Query: \"${QUERY}\""
QUERY=$(echo "$QUERY" | strconv urlenc)
RES=$(
    curl "https://mysterysear.ch/search?_utf8=%E2%9C%93&show_errors=true&q=${QUERY}" \
    -H "User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:45.0) Gecko/20100101 Firefox/45.0" \
    -H "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8" \
    -H "Referer: https://mysterysear.ch/" \
    -H "Accept-Language: en-US,en;q=0.5" \
    -H "Connection: keep-alive" \
    -H "Host: mysterysear.ch" \
    -w "\n%{http_code}" \
    --compressed \
    --silent
)

CODE=$(echo "$RES" | tail -n1)
if [[ "$CODE" -ne 302 ]]; then
    echo -e "\033[0;31mERROR\033[0m >>> ${RES}"
    exit 1
fi

if echo "$RES" | grep -q '<a href="/">'; then
    echo "Search for something more interesting (more than one word)."
    exit 1
fi

LOCATION=$(echo "$RES" | head -n1 | cut -d '"' -f2)
NEWQUERY=$(echo "$LOCATION" | cut -d '=' -f2 | strconv urldec)
echo "Search: ${NEWQUERY}"
echo "Link: ${LOCATION}"
