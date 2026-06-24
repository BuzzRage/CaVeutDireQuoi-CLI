# Trier par ordre alphabétique
sort_json(){
    # Check if .JSON file is correct
    jq -e . $file > /dev/null

    if [[ $? -ne 0 ]]; then
        exit 1
    fi


    # TODO : Make accent sorted normally ( é should be with e )
    #
    # jq '
    # to_entries
    # | map(. as $e
    #       | {
    #           e: $e,
    #           sortkey: ($e.key
    #             | gsub("é";"e")
    #             | gsub("è";"e")
    #             | gsub("ê";"e")
    #             | gsub("ë";"e")
    #             | gsub("à";"a")
    #             | gsub("â";"a")
    #             | gsub("ä";"a")
    #             | gsub("ç";"c")
    #             | gsub("î";"i")
    #             | gsub("ï";"i")
    #             | gsub("ô";"o")
    #             | gsub("ö";"o")
    #             | gsub("ù";"u")
    #             | gsub("û";"u")
    #             | gsub("ü";"u")
    #           )
    #         })
    # | sort_by(.sortkey, (.e.key))
    # | map(.e)
    # | from_entries
    # ' file.json



    tmp=$(mktemp)
    jq 'to_entries | sort_by(.key) | from_entries' "$file" > "$tmp"
    mv "$tmp" "$file"
}

