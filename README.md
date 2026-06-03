# CaVeutDireQuoi-CLI
---
## Ça veut dire quoi ? - Command Line Interface  (cvdq-cli) 

Outil pour expliquer les sigles et les abbréviations.
Le fichier peut être personnalisable pour ajouter des éléments.
Peut très bien être utilisé à titre personnel ou bien en contexte professionnel pour rapidement retrouver le sens du jargon technique et organisationnel de votre milieu professionnel.

<img width="916" height="256" alt="image" src="https://github.com/user-attachments/assets/71fe1053-c7e0-4946-b1be-4c92638b0617" />


## Vérifier le fichier `glossaire.json`

Après avoir ajouté un entrée, attention a bien vérifier que le fichier `.json` est correctemenet formaté.

Pour ce faire:
```bash
jq -e . glossaire.json
``` 
## Trier par ordre alphabétique

```bash
jq 'to_entries | sort_by(.key) | from_entries' glossaire.json >> glossaire.json
```

## TODO

- Ajouter un manuel
- Utiliser bashly ?
- Ajouter une commande pour ajouter une entrée (item) au fichier glaissaire
- Permettre de sourcer via un site externe (wikipedia ou autres)
- Ajout d'une fonction pour mettre dans le path ou dans /usr/bin/local
- Rendre insensible à la casse les item
- Faire que "-k type" soit interprété comme "-k meta.type"
- Lire config dans un .env ou autre
- Améliorer le mode verbose pour horodater et exprimer des niveaux d'erreurs
