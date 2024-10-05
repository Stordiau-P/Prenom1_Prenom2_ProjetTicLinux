#!/bin/bash

# Fichier contenant la liste des tâches
task_file="tasks.txt"

# Vérifier si le fichier existe, sinon le créer
if [[ ! -f $task_file ]]; then
    touch $task_file
fi

while true; do
    echo "Bonjour, veuillez choisir une action à réaliser en tapant 1, 2, 3, 4 ou 5"
    echo "1. Afficher la liste des tâches"
    echo "2. Ajouter une tâche"
    echo "3. Supprimer une tâche"
    echo "4. Quitter le programme"
    echo "5. Supprimer toutes les tâches"
    read -p "Veuillez entrer votre choix : " user_input

    if [[ "$user_input" == "1" ]]; then
        echo "Voici la liste des tâches actuelles :"
        if [[ -s $task_file ]]; then
            nl -s ". " "$task_file"  # Afficher les tâches avec numéros de ligne
        else
            echo "Aucune tâche trouvée."
        fi

    elif [[ "$user_input" == "2" ]]; then
        read -p "Veuillez écrire la tâche à exécuter : " task
        if [[ -n "$task" ]]; then
            echo "$task" >> "$task_file"  # Ajouter la tâche au fichier
            echo "Tâche ajoutée : $task"
        else
            echo "La tâche ne peut pas être vide."
        fi

    elif [[ "$user_input" == "3" ]]; then
        if [[ -s $task_file ]]; then
            # Afficher les tâches avec numéros de ligne
            nl -s ". " "$task_file"
            # Obtenir le nombre de lignes dans le fichier
            total_lines=$(wc -l < "$task_file")
            
            # Demander le numéro de tâche à supprimer
            read -p "Veuillez indiquer le numéro de la tâche à supprimer : " task_number
            
            # Vérifier si l'entrée est un numéro valide et dans la plage
            if [[ "$task_number" =~ ^[0-9]+$ && "$task_number" -ge 1 && "$task_number" -le "$total_lines" ]]; then
                # Supprimer la tâche spécifiée
                sed -i "${task_number}d" "$task_file"
                echo "Tâche numéro $task_number supprimée."
            else
                echo "Numéro de tâche invalide. Veuillez entrer un numéro entre 1 et $total_lines."
            fi
        else
            echo "Il n'y a aucune tâche à supprimer."
        fi

    elif [[ "$user_input" == "4" ]]; then
        read -p "Voulez-vous quitter le programme ? (oui/non) " quit_choice
        if [[ "$quit_choice" == "oui" ]]; then
            echo "Fin du programme"
            break
        else
            echo "La boucle continue"
        fi

    elif [[ "$user_input" == "5" ]]; then
        # Supprimer toutes les tâches
        > "$task_file"  # Vide le contenu du fichier
        echo "Toutes les tâches ont été supprimées."

    else
        echo "Option non valide. Veuillez entrer 1, 2, 3, 4 ou 5."
    fi
done
