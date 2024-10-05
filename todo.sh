#!/bin/bash

while true; do
    echo "Bonjour, veuillez choisir une action à réaliser en tapant 1, 2 ou 3"
    echo "1 Afficher la liste des tâches"
    echo "2 Ajouter une tâche"
    echo "3 Supprimer une tâche"
    read -p "Ou voulez-vous quitter le programme ? (oui/non)" user_input
    if [[ "$user_input" == "oui" ]]; then
        echo "Fin du programme"
        break
    elif [[$user_input == "1"]]; then
        echo "Voici la liste des tâches actuelles"
    elif [[$user_input == "2"]]; then
        echo "Veuillez écrire la tâche à executer"
    elif [[$user_input == "3"]]; then
        echo "Veuillez indiquer la tache à supprimer"
    else
        echo "la boucle continue"
    fi
done