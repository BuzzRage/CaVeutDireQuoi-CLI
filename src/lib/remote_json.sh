remote_json() {


    tmp_in=$(mktemp)
    tmp_out=$(mktemp)

    curl -s $REMOTE_SOURCE > $tmp_in

    # Passe du format de data.occitanie.education.gouv.fr au format json attendu
    jq 'reduce .[] as $item ({};
        .[$item.sigle] = {
            long_form: $item.definition,
            desc: ($item.commentaire // $item.domaine),
            meta: {
                type: "undefined",
                source: "https://data.occitanie.education.gouv.fr/api/explore/v2.1/catalog/datasets/fr-en-occitanie-glossaire-sigles-acronymes/exports/json"
            }
        })' "$tmp_in" > "$tmp_out"


    jq -e . $tmp_out > /dev/null

    if [[ $? -ne 0 ]]; then
        log "Remote file $REMOTE_SOURCE is not well formatted"
        exit 1
    else
        file=$tmp_out
        print_attribute
        rm $tmp_out $tmp_in
    fi

}
