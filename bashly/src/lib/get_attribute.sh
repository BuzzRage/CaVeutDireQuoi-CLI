get_attribute(){

    # jq returns null if key absent (empty) ; -r to get raw string ; split the argument key "meta.type" in an array (splitted by dot '.') as ["meta","type"] ; Then reduce ARRAY[] as $p ( INIT; UPDATE )
    ATTR=$(jq -r --arg item "$item" --arg key $selected_key 'reduce ($key | split("."))[] as $p (.[$item]; if . == null then null else .[$p] end) // empty' "$file")


    if [ -z "$ATTR" ]; then
        echo "No output found for attribute '$selected_key' for item '$item'" >&2
        exit 1
    fi

    printf "%s\n" "$ATTR"


}
