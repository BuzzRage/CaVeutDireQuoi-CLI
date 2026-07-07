% cvdq-cli(1) Version 1.2.0 | Traducteur d'acronymes et de sigles
% BuzzRage
% July 2026

NAME
==================================================

**cvdq-cli** - Traducteur d'acronymes et de sigles

SYNOPSIS
==================================================

**cvdq-cli** [FILE] [OPTIONS]

DESCRIPTION
==================================================

Traducteur d'acronymes et de sigles


ARGUMENTS
==================================================

FILE
--------------------------------------------------

.JSON file to load as a glossary

- Default Value: **glossaire.json**

OPTIONS
==================================================

--add, -a NEW_ITEM
--------------------------------------------------

New Item to add in FILE


--key, -k KEY
--------------------------------------------------

Key of the attribute to look for in the .JSON file

- Default Value: **desc**

--verbose, -v
--------------------------------------------------

Set verbose output to true


--item, -i ITEM
--------------------------------------------------

item to look for in the .JSON file


--sort, -s
--------------------------------------------------

Sort the .JSON


--format, -f
--------------------------------------------------

Format the FILE in the expected .JSON format


ENVIRONMENT VARIABLES
==================================================

DEFAULT_GLOSSARY
--------------------------------------------------

Set the default glossary file to "glossaire.json"


EXAMPLES
==================================================

~~~
cvdq-cli "glossaire-reseau.json" -i IETF

cvdq-cli -k desc -i IETF

cvdq-cli --sort "glossaire-reseau.json" --verbose

cvdq-cli --add UNESCO

cvdq-cli --format "glossaire-medecine.json"

cvdq-cli -h

~~~

# ISSUE TRACKER
Report issues at \<https://github.com/BuzzRage/CaVeutDireQuoi-CLI/issues\>
