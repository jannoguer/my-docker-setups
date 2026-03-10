#!/bin/bash

echo -e "\033[1;31mWARNING: This will STOP and DELETE all containers, images, volumes, and networks.\033[0m"
read -p "Are you sure you want to nuke everything? (y/N): " confirm1

if [[ "$confirm1" =~ ^[Yy]$ ]]; then
    echo -e "\033[0;31mLAST CHANCE: This action CANNOT be undone.\033[0m"
    read -p "Are you ABSOLUTELY sure you want to proceed? (y/N): " confirm2
    
    if [[ "$confirm2" =~ ^[Yy]$ ]]; then
        echo "Stopping all containers..."
        containers=$(docker ps -aq)
        if [ -n "$containers" ]; then
            docker stop $containers > /dev/null
            docker rm $containers > /dev/null
        fi

        echo "Running full system prune..."
        docker system prune -a --volumes --force
        
        echo
        echo -e "\033[0;32mNuke complete. Clean slate achieved.\033[0m"
    else
        echo -e "\033[0;33mAborted at the final step. Your containers are safe.\033[0m"
    fi
else
    echo -e "\033[0;33mAborted. Your containers live to see another day.\033[0m"
fi
