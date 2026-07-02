# Trier par ordre alphabétique
sort_json(){
    # Check if .JSON file is correct
    jq -e . $file > /dev/null

    if [[ $? -ne 0 ]]; then
        exit 1
    fi

    jq '
    to_entries
    | map(. as $e
          | {
              e: $e,
              sortkey: ($e.key
                | gsub("é";"e")
                | gsub("è";"e")
                | gsub("ê";"e")
                | gsub("ë";"e")
                | gsub("à";"a")
                | gsub("â";"a")
                | gsub("ä";"a")
                | gsub("ç";"c")
                | gsub("î";"i")
                | gsub("ï";"i")
                | gsub("ô";"o")
                | gsub("ö";"o")
                | gsub("ù";"u")
                | gsub("û";"u")
                | gsub("ü";"u")
                | gsub("É";"E")
                | gsub("È";"E")
                | gsub("Ê";"E")
                | gsub("Ë";"E")
                | gsub("À";"A")
                | gsub("Â";"A")
                | gsub("Ä";"A")
                | gsub("Ç";"C")
                | gsub("Î";"I")
                | gsub("Ï";"I")
                | gsub("Ô";"O")
                | gsub("Ö";"O")
                | gsub("Ù";"U")
                | gsub("Û";"U")
                | gsub("Ü";"U")
              )
            })
    | sort_by(.sortkey, (.e.key))
    | map(.e)
    | from_entries
    ' $file



    tmp=$(mktemp)
    jq 'to_entries | sort_by(.key) | from_entries' "$file" > "$tmp"
    mv "$tmp" "$file"
}

