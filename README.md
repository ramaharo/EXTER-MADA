# Modèle d'Équilibre Général Calculable - EXTER-MADA

Ce projet vise à modéliser et simuler l'impact de politiques économiques et de chocs macroéconomiques à Madagascar à l'aide d'un modèle d'équilibre général calculable (MEGC) fondé sur le cadre pédagogique EXTER et enrichi par les structures du modèle PEP. Le projet s'appuie sur la Matrice de Comptabilité Sociale (MCS) issue du TRE 2019 de l'INSTAT.

## Structure du projet

Le dépôt est organisé selon la structure suivante :

- `src/` : Fichier principal `main.gms` et le fichier `resultat.gms` pour l'affichage des resultats.
- `data/` : Matrice de Comptabilité Sociale (MCS 2019) au format Excel.
- `output/` : Fichiers de résultats générés par GAMS (fichiers texte synthétiques et exports Excel).
- `document/` : Documentation du modèle (également disponible et citable sur Zenodo : [https://doi.org/10.5281/zenodo.22554589](https://doi.org/10.5281/zenodo.22554589)).

## Prérequis

Pour exécuter les modèles de ce projet, vous devez disposer du logiciel suivant:

- [GAMS](https://www.gams.com/download/)

## Utilisation

1. Cloner le dépôt :
    ```sh
    git clone https://github.com/ramaharo/EXTER-MADA.git
    cd exter-mada
    ```

2. Exécuter les modèles GAMS :
    ```sh
    gams src/main.gms
    ```