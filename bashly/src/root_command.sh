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


echo "$item : $(get_attribute)"


