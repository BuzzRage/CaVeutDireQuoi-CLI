# CaVeutDireQuoi-CLI
---
## Ça veut dire quoi ? - Command Line Interface  (cvdq-cli) 

Outil pour expliquer les sigles et les abbréviations.
Le fichier peut être personnalisable pour ajouter des éléments.
Peut très bien être utilisé à titre personnel ou bien en contexte professionnel pour rapidement retrouver le sens du jargon technique et organisationnel de votre milieu professionnel.

<img width="506" height="654" alt="image" src="https://github.com/user-attachments/assets/3a94f54b-f924-47d4-839c-6f4e634ce131" />

## Vérifier le fichier `glossaire.json`

Après avoir ajouté une entrée, attention a bien vérifier que le fichier `.json` est correctement formaté.

Pour ce faire:
```bash
jq -e . glossaire.json
``` 

## Trier un glossaire par ordre alphabétique
```bash
cvdq-cli --sort FILE
```

## Afficher le manuel

```bash
man docs/cvdq-cli.1 
```
## Ajouter une entrée

```bash
cvdq-cli --add UNESCO glossaire-ONU.json
```

## TODO

- Réorganiser l'architecture du projet (et regeneration auto de la doc, show_usage ne s'update pas)
- Permettre de sourcer via un site externe (wikipedia ou autres)
- Ajout d'une fonction pour mettre dans le path ou dans /usr/bin/local
- Ajout de requirements si dev (ruby / bashly)
- Rendre insensible à la casse les item
- Faire que "-k type" soit interprété comme "-k meta.type"
- Lire config dans un .env ou autre ( faire .env.exemple )
- Améliorer le mode verbose pour horodater et exprimer des niveaux d'erreurs (et log les aguments)
- ajout d'une option "-all" pour afficher toutes les infos d'un item (item : long_form : desc : type)
- improve color management for docs
