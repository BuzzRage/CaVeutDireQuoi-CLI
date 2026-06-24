# CaVeutDireQuoi-CLI
---
## Ça veut dire quoi ? - Command Line Interface  (cvdq-cli) 

Outil pour expliquer les sigles et les abbréviations.
Le fichier peut être personnalisable pour ajouter des éléments.
Peut très bien être utilisé à titre personnel ou bien en contexte professionnel pour rapidement retrouver le sens du jargon technique et organisationnel de votre milieu professionnel.

<img width="932" height="255" alt="image" src="https://github.com/user-attachments/assets/01b32a05-df01-4db0-826e-144c64fccc1c" />


## Vérifier le fichier `glossaire.json`

Après avoir ajouté un entrée, attention a bien vérifier que le fichier `.json` est correctemenet formaté.

Pour ce faire:
```bash
jq -e . glossaire.json
``` 

## Trier un glossaire par ordre alphabétique
```bash
cvdq-cli FILE --sort
``̀` 

## Afficher le manuel

```bash
man docs/cvdq-cli.1 
```

## TODO

- Ajouter une commande pour ajouter une entrée (item) au fichier glossaire
- Permettre de sourcer via un site externe (wikipedia ou autres)
- Ajout d'une fonction pour mettre dans le path ou dans /usr/bin/local
- Ajout de requirements si dev (ruby / bashly)
- Rendre insensible à la casse les item
- Faire que "-k type" soit interprété comme "-k meta.type"
- Lire config dans un .env ou autre ( faire .env.exemple )
- Améliorer le mode verbose pour horodater et exprimer des niveaux d'erreurs
- ajout d'une option "-all" pour afficher toutes les infos d'un item (item : long_form : desc : type)
- clean repos
- improve color management for docs
