#!/bin/bash
task_file="tasks.txt" # Définit le nom du fichier où les tâches seront stockées
while true; do # Boucle infinie pour relancer le programme tant que l'utilisateur n'a pas choisis l'option pour quitter"
    echo "Bonjour, veuillez choisir une action à réaliser en tapant 1, 2 ou 3" # Affichage des options
    echo "1. Afficher la liste des tâches"
    echo "2. Ajouter une tâche"
    echo "3. Supprimer une tâche"
    echo "4. Quitter le programme"
    echo "5. Supprimer toutes les tâches"
    read -p "Veuillez entrer votre choix : " user_input # Récupération du choix de l'utilisateur
    if [[ "$user_input" == "1" ]]; then # Si l'utilisateur a choisi le 1 il voit les tâches s'afficher sinon on lui indique qu'il n'y en a pas
        echo "Voici la liste des tâches actuelles"
        if [[ ! -s $task_file ]]; then
            echo "Aucune tâche trouvée."
        else
            nl -s ". " "$task_file"
        fi
    elif [[ "$user_input" == "2" ]]; then # Si l'utilisateur choisit le 2 il peut entrer une tâche qui s'ajoute au fichier ou un message s'affiche s'il ne met rien
        read -p "Veuillez écrire la tâche à exécuter : " task
        if [[ -n "$task" ]]; then
            echo "$task" >> "$task_file"
            echo "Tâche ajoutée : $task"
        else
            echo "Aucune tâche ajoutée"
        fi
    elif [[ "$user_input" == "3" ]]; then #Si l'utilisateur choisit le 3 la liste s'affiche et il peut entre le numéro de la tâche a supprimer il est obligé de choisir une entrée valide sinon il a une erreur
        if [[ -s $task_file ]]; then
            nl -s ". " "$task_file"
            total_lines=$(wc -l < "$task_file")
            
            read -p "Veuillez indiquer le numéro de la tâche à supprimer : " task_number
            
            if [[ "$task_number" =~ ^[0-9]+$ && "$task_number" -ge 1 && "$task_number" -le "$total_lines" ]]; then
                sed -i "${task_number}d" "$task_file"
                echo "Tâche numéro $task_number supprimée."
            else
                echo "Numéro de tâche invalide. Veuillez entrer un numéro entre 1 et $total_lines."
            fi
        else
            echo "Il n'y a aucune tâche à supprimer."
        fi

    elif [[ "$user_input" == "4" ]]; then #Si l'utilisateur choisit 4 on lui demande s'il veut quitter le programme
        read -p "Voulez-vous quitter le programme ? (oui/non) " quit_choice
        if [[ "$quit_choice" == "oui" ]]; then
            echo "Fin du programme"
            break
        fi
    elif [[ "$user_input" == "5" ]]; then #Si l'utilisateur choisit 5 il supprime toute la liste du fichier"
        > "$task_file"
        echo "Toutes les tâches ont été supprimées."
    else
        echo "Option non valide. Veuillez entrer 1, 2, 3, 4 ou 5." #Si l'utilisateur n'entre pas une des 5 options on le lui indique
    fi
done