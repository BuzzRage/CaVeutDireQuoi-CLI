#!/usr/bin/env bash

# Usage: ./cvdq-cli.sh ABBR

### Variables
# Available keys
keys=("short_form" "long_form" "desc" "meta" 'meta.type' 'meta.source' )

# Default selected key : desc
default_selected_key=${keys[2]}

# Default file
default_file="glossaire.json"

verbose=false


# Show Usage
show_usage(){
    echo -e "Usage : $0 [OPTION]... \033[0;31m ITEM \033[0m";
    echo -e "\t -h       \t Show this message"
    echo -e "\t -i \033[0;31m ITEM \033[0m \t Look for \033[0;31m ITEM \033[0m"
    echo -e "\t -f \033[0;31m FILE \033[0m \t Use \033[0;31m FILE \033[0m as glossary (default : glossaire.json)"
    echo -e "\t -k \033[0;31m KEY  \033[0m \t Use \033[0;31m KEY \033[0m as attribute to look for (default : desc)"
    echo -e "\t -v      \t Enable verbose mode \n"
    echo -e "List of valid \033[0;31m KEY  \033[0m :"
    for key in ${keys[@]}; do
        echo -e "\t \033[0;35m $key \033[0m"
    done
    exit 0;
}

# get attribute
get_attribute(){
    # jq returns null if key absent (empty) ; -r to get raw string ; split the argument key "meta.type" in an array (splitted by dot '.') as ["meta","type"] ; Then reduce ARRAY[] as $p ( INIT; UPDATE )
    ATTR=$(jq -r --arg item "$1" --arg key $selected_key 'reduce ($key | split("."))[] as $p (.[$item]; if . == null then null else .[$p] end) // empty' "$2")

    if [ -z "$ATTR" ]; then
        echo "No output found for attribute '$selected_key' for item '$1'" >&2
        exit 1
    fi

    printf "%s\n" "$ATTR"
}

log(){
    if [ "$verbose" == true ]; then
        echo $@
    fi
}


if [ "$#" -eq 0 ]; then
    show_usage
fi

# Default settings
selected_key=$default_selected_key
DB=$default_file
if [ "$#" -eq 1 ]; then
    ABBR="$1"
fi

while getopts "hf:i:k:v" opt; do
    case $opt in
        f)
            DB=$OPTARG
            ;;
        h)
            show_usage
            exit 0
            ;;
        i)
            ABBR=$OPTARG
            ;;
        k)
            selected_key=$OPTARG
            ;;
        v)
            verbose=true
            log "Verbose mode enabled"
            ;;
    esac
done
shift $((OPTIND - 1))


# Verifications

if [[ -v ABBR ]]; then
    log "ABBR aldready defined."
else
    log "Item $1 will be searched."
    ABBR=$1
fi


if [ -f "$DB" ]; then
    log "Input file $DB will be used as a glossary."
else
    log "Error: Glossary file not found: $DB" >&2
    exit 3
fi

for key in "${keys[@]}"; do
    if [ "$selected_key" == "$key" ]; then
        log "Selected key $selected_key will be used as a key."
        valid_key=true
    fi
done

if [ ! "$valid_key" == true ]; then
    log "Error: $selected_key is not a valid key. Valid keys: $keys"
    exit 2
fi







echo "$ABBR : $(get_attribute "$ABBR" "$DB")"
