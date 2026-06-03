#!/usr/bin/env bash

# Usage: ./cvdq-cli.sh ABBR


# Available keys
keys=("short_form" "long_form" "desc" "meta" "meta.type" "meta.source" )
selected_key=${keys[2]}

show_usage(){
    echo "Usage: $0 ABBR";
    exit 2;
}


if [[ -z "$1" || ( $@ == "--help") ||  $@ == "-h" ]]; then
    show_usage
fi

ABBR="$1"
DB="glossaire.json"

if [ ! -f "$DB" ]; then
    echo "Glossary file not found: $DB" >&2
    exit 3
fi


# jq returns null if key absent; -r to get raw string
DESC=$(jq -r --arg item "$ABBR" --arg key "$selected_key" '.[$item].[$key] // empty' "$DB")

if [ -z "$DESC" ]; then
    echo "No description found for '$ABBR'" >&2
    exit 1
fi

echo "$DESC"
