## echo "# This file is located at 'src/root_command.sh'."
## echo "# It contains the implementation for the 'cvdq-cli' command."
## echo "# The code you write here will be wrapped by a function named 'root_command()'."
## echo "# Feel free to edit this file; your changes will persist when regenerating."
## inspect_args

# Available keys
keys=("short_form" "long_form" "desc" "meta" 'meta.type' 'meta.source' )

selected_key=${args[--key]}
item=${args[item]}
file=${args[--file]}

if [[ ${args[--verbose]} ]]; then
    verbose=true
else
    verbose=false
fi

log "$item $file $selected_key"

# jq returns null if key absent (empty) ; -r to get raw string ; split the argument key "meta.type" in an array (splitted by dot '.') as ["meta","type"] ; Then reduce ARRAY[] as $p ( INIT; UPDATE )
ATTR=$(jq -r --arg item "$item" --arg key $selected_key 'reduce ($key | split("."))[] as $p (.[$item]; if . == null then null else .[$p] end) // empty' "$file")


if [ -z "$ATTR" ]; then
    echo "No output found for attribute '$selected_key' for item '$item'" >&2
    exit 1
fi

printf "%s\n" "$ATTR"

