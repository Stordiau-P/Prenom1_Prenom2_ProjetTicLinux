#!/bin/bash
task_file="tasks.txt"
while true; do
    echo "Bonjour, veuillez choisir une action à réaliser en tapant 1, 2 ou 3"
    echo "1. Afficher la liste des tâches"
    echo "2. Ajouter une tâche"
    echo "3. Supprimer une tâche"
    echo "4. Quitter le programme"
    read -p "Veuillez entrer votre choix : " user_input
    if [[ "$user_input" == "1" ]]; then
        echo "Voici la liste des tâches actuelles"
        if [[ ! -s $task_file ]]; then
            echo "Aucune tâche trouvée."
        else
            nl -s ". " "$task_file"
        fi
    elif [[ "$user_input" == "2" ]]; then
        read -p "Veuillez écrire la tâche à exécuter : " task
        if [[ -n "$task" ]]; then
            echo "$task" >> "$task_file"
            echo "Tâche ajoutée."
        else
            echo "Aucune tâche ajoutée"
        fi
    elif [[ "$user_input" == "3" ]]; then
        echo "Veuillez indiquer la tâche à supprimer"
    elif [[ "$user_input" == "4" ]]; then
        read -p "Voulez-vous quitter le programme ? (oui/non) " quit_choice
        if [[ "$quit_choice" == "oui" ]]; then
            echo "Fin du programme"
            break
        else
            echo "La boucle continue"
        fi
    fi
done