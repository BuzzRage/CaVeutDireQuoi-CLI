## echo "# This file is located at 'src/root_command.sh'."
## echo "# It contains the implementation for the 'cvdq-cli' command."
## echo "# The code you write here will be wrapped by a function named 'root_command()'."
## echo "# Feel free to edit this file; your changes will persist when regenerating."
## inspect_args

# Variables
# Available keys
declare -g -A keys=("short_form" "long_form" "desc" "meta" 'meta.type' 'meta.source' )
declare -g selected_key=${args[--key]}
declare -g item=${args[--item]}
declare -g file=${args['FILE']}


## Default selected key : desc 
## default_selected_key=${keys[2]}
# # 
# # 
# # 
# # # Default settings
# # selected_key=$default_selected_key
# # DB=$default_file
# # if [ "$#" -eq 1 ]; then
# #     ABBR="$1"
# # fi
# # 
# # while getopts "hf:i:k:v" opt; do
# #     case $opt in
# #         f)
# #             DB=$OPTARG
# #             ;;
# #         h)
# #             show_usage
# #             exit 0
# #             ;;
# #         i)
# #             ABBR=$OPTARG
# #             ;;
# #         k)
# #             selected_key=$OPTARG
# #             ;;
# #         v)
# #             verbose=true
# #             log "Verbose mode enabled"
# #             ;;
# #         *)
# #             show_usage
# #             exit 1
# #             ;;
# #     esac
# # done
# # shift $((OPTIND - 1))
# # 
# # 
# # # Verifications
# # 
# # if [[ -v ABBR ]]; then
# #     log "ABBR aldready defined."
# # else
# #     log "Item $1 will be searched."
# #     ABBR=$1
# # fi
# # 
# # 
# # if [ -f "$DB" ]; then
# #     log "Input file $DB will be used as a glossary."
# # else
# #     log "Error: Glossary file not found: $DB" >&2
# #     exit 3
# # fi
# # 
# # for key in "${keys[@]}"; do
# #     if [ "$selected_key" == "$key" ]; then
# #         log "Selected key $selected_key will be used as a key."
# #         valid_key=true
# #     fi
# # done
# # 
# # if [ ! "$valid_key" == true ]; then
# #     log "Error: $selected_key is not a valid key. Valid keys: $keys"
# #     exit 2
# # fi
# # 
# # echo "$ABBR : $(get_attribute "$ABBR" "$DB")"


if [[ ${args[--verbose]} ]]; then
    verbose=true
else
    verbose=false
fi

log "$item $file $selected_key"

if [[ ${args[--sort]} ]]; then
    sort_json
    echo "$file is sorted"
    exit 0
fi

echo "$item : $(get_attribute)"


