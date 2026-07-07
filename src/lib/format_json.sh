format_json() {

    # Check if input .JSON file is correct
    jq -e . $file > /dev/null

    if [[ $? -ne 0 ]]; then
        log "File $file is not well formatted"
        exit 1
    fi

    tmp=$(mktemp)

    in=$file
    out=$tmp

    # Passe du format de data.occitanie.education.gouv.fr au format json attendu
    jq 'reduce .[] as $item ({};
        .[$item.sigle] = {
            long_form: $item.definition,
            desc: ($item.commentaire // $item.domaine),
            meta: {
                type: "undefined",
                source: "https://data.occitanie.education.gouv.fr/api/explore/v2.1/catalog/datasets/fr-en-occitanie-glossaire-sigles-acronymes/exports/json"
            }
        })' "$in" > "$out"


    jq -e . $out > /dev/null

    if [[ $? -ne 0 ]]; then
        log "File $file is not well formatted"
        exit 1
    else
        # Crée un backup
        mv $in $file.bkp

        # Remplace le fichier d'origine
        mv $out $in
    fi

}
