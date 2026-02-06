#!/bin/bash

echo "Starting Safe Clean..."
echo "NOTE: Stopped containers will be PRESERVED."
echo

echo "--- Pruning Unused Images ---"
docker image prune -a --force

echo "--- Pruning Unused Volumes ---"
docker volume prune --force

echo "--- Pruning Unused Networks ---"
docker network prune --force

echo "--- Pruning Build Cache ---"
docker builder prune --force

echo
echo "Cleanup complete."
