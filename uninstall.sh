#!/bin/bash

echo "Starting to uninstall"

set -e

# Stop and remove containers, networks, etc.
./dockerclearall.sh

# Normalize input to lowercase and compare
input=$(echo "$1" | tr '[:upper:]' '[:lower:]')

if [[ "$input" == "y" || "$input" == "yes" ]]; then
    sudo rm -rf data artifactory*
    echo "Volumes removed"
else
    echo "Finished and not removing volumes"
fi

echo "Done"