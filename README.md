# CaVeutDireQuoi-CLI
---
## Ça veut dire quoi ? - Command Line Interface  (cvdq-cli) 

Outil pour expliquer les sigles et les abbréviations.
Le fichier peut être personnalisable pour ajouter des éléments (manuellement dans le .JSON ou via l'outil).
Peut très bien être utilisé à titre personnel ou bien en contexte professionnel pour rapidement retrouver le sens du jargon technique et organisationnel de votre milieu professionnel.

<img width="559" height="860" alt="image" src="https://github.com/user-attachments/assets/63e491d2-550d-4c67-a615-7a30af0370fa" />

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

- Améliorer la sortie de "cvdq-cli FILE -i ITEM" (ajout couleur, espace, mise en forme etc..)
- Regeneration auto de la doc (les couleurs du show_usage ne s'update pas) ou l'intégrer lors du rebuild
- Permettre de sourcer via un site externe (wikipedia ou autres)
- Ajout d'une fonction pour mettre dans le path ou dans /usr/bin/local
- Ajout de requirements si dev (ruby / bashly)
- Rendre insensible à la casse les item
- Faire que "-k type" soit interprété comme "-k meta.type"
- Afficher la liste des key que l'utilisateur peut demander
- Lire config dans un .env ou autre ( faire .env.exemple )
- Améliorer le mode verbose pour horodater et exprimer des niveaux d'erreurs (et log les aguments)
- ajout d'une option "-all" pour afficher toutes les infos d'un item (item : long_form : desc : type)
- improve color management for docs
- Les fonctions doivent prendre des arguments plutôt que d'utiliser des variables globales
