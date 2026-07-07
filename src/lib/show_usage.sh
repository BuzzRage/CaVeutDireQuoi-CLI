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

# Custom cvdq_cli_usage ( bashly-generated + additionnal manual edits )
cvdq_cli_usage() {
  printf "cvdq-cli - Traducteur d'acronymes et de sigles\n\n"

  printf "%s\n" "$(green_bold "Usage:")"
  printf "  cvdq-cli [FILE] [OPTIONS]\n"
  printf "  cvdq-cli --help | -h\n"
  printf "  cvdq-cli --version\n"
  echo

  # :command.long_usage
  if [[ -n "$long_usage" ]]; then
    # :command.usage_options
    printf "%s\n" "$(green_bold "Options:")"

    # :command.usage_flags
    # :flag.usage
    printf "  %s\n" "$(red "--add, -a NEW_ITEM")"
    printf "    New Item to add in FILE\n"
    echo

    # :flag.usage
    printf "  %s\n" "$(red "--key, -k KEY")"
    printf "    Key of the attribute to look for in the .JSON file\n"
    printf "    %s\n" "Default: $(cyan "desc")"
    echo

    # :flag.usage
    printf "  %s\n" "$(red "--verbose, -v")"
    printf "    Set verbose output to true\n"
    echo

    # :flag.usage
    printf "  %s\n" "$(red "--item, -i ITEM")"
    printf "    item to look for in the .JSON file\n"
    echo

    # :flag.usage
    printf "  %s\n" "$(red "--sort, -s")"
    printf "    Sort the .JSON\n"
    echo

    # :flag.usage
    printf "  %s\n" "$(red "--format, -f")"
    printf "    Format the $(yellow "FILE") in the expected .JSON format\n"
    echo

    # :command.usage_fixed_flags
    printf "  %s\n" "$(red "--help, -h")"
    printf "    Show this help\n"
    echo
    printf "  %s\n" "$(red "--version")"
    printf "    Show version number\n"
    echo

    # :command.usage_args
    printf "%s\n" "$(green_bold "Arguments:")"

    # :argument.usage
    printf "  %s\n" "$(yellow "FILE")"
    printf "    .JSON file to load as a glossary\n"
    printf "    %s\n" "Default: $(cyan glossaire.json)"
    echo

    # :command.usage_environment_variables
    printf "%s\n" "$(green_bold "Environment Variables:")"

    # :environment_variable.usage
    printf "  %s\n" "$(magenta "DEFAULT_GLOSSARY")"
    printf "    Set the default glossary file to \"$(cyan "glossaire.json")\"\n"
    echo

    # :command.usage_examples
    printf "%s\n" "$(green_bold "Examples:")"
    printf "  cvdq-cli \"$(cyan "glossaire-reseau.json")\" -i $(red "IETF")\n"
    printf "  cvdq-cli -k $(cyan desc) -i $(red "IETF")\n"
    printf "  cvdq-cli --sort \"$(cyan "glossaire-reseau.json")\" --verbose\n"
    printf "  cvdq-cli --add $(red "UNESCO")\n"
    printf "  cvdq-cli --format \"$(cyan "glossaire-medecine.json")\"\n"
    printf "  cvdq-cli -h\n"
    echo

  fi
}
