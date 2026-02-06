#!/bin/bash

# Get list of running containers
mapfile -t containers < <(docker ps --format "{{.Names}}")

if [ ${#containers[@]} -eq 0 ]; then
    echo "No running containers found."
    exit 1
fi

echo "Select a container to attach to:"
for i in "${!containers[@]}"; do
    echo "[$i] ${containers[$i]}"
done

read -p "Enter index: " idx

if [[ -n "${containers[$idx]}" ]]; then
    echo "Attaching to ${containers[$idx]}..."
    docker exec -it "${containers[$idx]}" //bin/bash || docker exec -it "${containers[$idx]}" //bin/sh
else
    echo "Invalid selection."
fi
