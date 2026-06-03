#!/usr/bin/env bash

# Usage: ./cvdq-cli.sh ABBR

### Variables
# Available keys
keys=("short_form" "long_form" "desc" "meta" "meta.type" "meta.source" )

# Default selected key : desc
default_selected_key=${keys[2]}

# Default file
default_file="glossaire.json"

verbose=false


# Show Usage
show_usage(){
    echo "Usage: $0 ABBR";
    exit 2;
}

# get attribute
get_attribute(){
    # jq returns null if key absent; -r to get raw string
    ATTR=$(jq -r --arg item "$1" --arg key "$selected_key" '.[$item].[$key] // empty' "$2")

    if [ -z "$ATTR" ]; then
        echo "No description found for '$1'" >&2
        exit 1
    fi

    printf "%s\n" "$ATTR"
}


if [ -z "$1" ]; then
    show_usage
fi

# Default settings
selected_key=$default_selected_key
DB=$default_file


while getopts "vhf:" opt; do
    case $opt in
        v)
            echo "Verbose mode enabled"
            verbose=true
            ;;
        f)
            DB=$OPTARG
            ;;
        h)
            show_usage
            exit 0
            ;;
    esac
done
shift $((OPTIND - 1))


# Attributions
ABBR="$1"

if [ "$verbose" == true ]; then
    echo "Input file $DB will be used as a glossary."
fi


if [ ! -f "$DB" ]; then
    echo "Glossary file not found: $DB" >&2
    exit 3
fi



echo $(get_attribute "$ABBR" "$DB")
