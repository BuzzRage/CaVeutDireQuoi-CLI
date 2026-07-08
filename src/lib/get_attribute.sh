get_attribute(){

    # jq returns null if key absent (empty) ; -r to get raw string ; split the argument key "meta.type" in an array (splitted by dot '.') as ["meta","type"] ; Then reduce ARRAY[] as $p ( INIT; UPDATE )
    ATTR=$(jq -r --arg item "$item" --arg key "$1" 'reduce ($key | split("."))[] as $p (.[$item]; if . == null then null else .[$p] end) // empty' "$file")


    if [ -z "$ATTR" ]; then
        echo "No output found for attribute '$1' for item '$item'" >&2
        exit 1
    fi

    printf "%s\n" "$ATTR"
}

print_attribute(){
    echo "$item : $(get_attribute "long_form")"
    echo "$(get_attribute "desc")"

    if [[ "$selected_key" != "desc" && "$selected_key" != "long_form" ]]; then
        echo "$selected_key : $(get_attribute "$selected_key")"
    fi
}

set_attribute(){
    # TODO
    echo "TODO"
}

add_entry(){
        echo "=== Fichier : $(cyan "$file") <- Ajout de l'entrée : $(red "$NEW_ITEM") ==="
        read -rp "$(green long_form) : "    LONG_FORM ; keys['long_form']=$LONG_FORM
        read -rp "$(green desc) : "         DESC      ; keys['desc']=$DESC
        read -rp "$(green type) : "         TYPE      ; keys['meta.type']=$TYPE
        read -rp "$(green source) : "       SOURCE    ; keys['meta.source']=$SOURCE

        # Construit le JSON en échappant proprement les caractères spéciaux
        json=$(  jq -n \
            --arg key "$NEW_ITEM" \
            --arg long_form "${keys['long_form']}" \
            --arg desc "${keys['desc']}" \
            --arg type "${keys['meta.type']}" \
            --arg source "${keys['meta.source']}" \
            '{($key): {long_form: $long_form, desc: $desc, meta: {type: $type, source: $source}}}')

        if [[ -f "$file" ]]; then
            tmp="$(mktemp)"
            jq --argjson new "$json" '. * $new' "$file" > "$tmp"
            mv "$tmp" "$file"
            sort_json $file
            log "Ajout/merge effectué dans: $file"
        else
            echo "$json" > "$file"
            log "Fichier créé: $file"
        fi
        echo "Contenu ajouté:"
        echo "$json" | jq .
}
