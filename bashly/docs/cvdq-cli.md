% cvdq-cli(1) Version 0.1.0 | Traducteur d'acronymes et de sigles
% BuzzRage
% June 2026

NAME
==================================================

**cvdq-cli** - Traducteur d'acronymes et de sigles

SYNOPSIS
==================================================

**cvdq-cli** ITEM [OPTIONS]

DESCRIPTION
==================================================

Traducteur d'acronymes et de sigles


ARGUMENTS
==================================================

ITEM
--------------------------------------------------

item to look for in the glossary

- *Required*

OPTIONS
==================================================

--key, -k ATTRIBUTE
--------------------------------------------------

Key of the attribute to look for in the .JSON file (default: "desc")

- Default Value: **desc**

--verbose, -v
--------------------------------------------------

Set verbose output to true


--item, -i ITEM
--------------------------------------------------

item to look for in the .JSON file


--file, -f JSON
--------------------------------------------------

.JSON file to load as a glossary (default: "glossaire.json")

- Default Value: **glossaire.json**

ENVIRONMENT VARIABLES
==================================================

DEFAULT_GLOSSARY
--------------------------------------------------

Set the default glossary file to "glossaire.json"


EXAMPLES
==================================================

~~~
cvdq-cli SNCF

cvdq-cli -f "glossaire-reseau.json" IETF

cvdq-cli -k desc IETF

cvdq-cli -h

~~~

# ISSUE TRACKER
Report issues at \<https://github.com/BuzzRage/CaVeutDireQuoi-CLI/issues\>
