# Legacy show usage (homeade, not bashly-generated)
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
