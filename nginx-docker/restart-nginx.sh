#!/bin/bash

# color vars
GREEN='\033[0;32m'
RED='\033[0;31m'
WHITE='\033[00m'

# Define container name
CONTAINER_NAME="nginx"

# Run nginx configuration test
echo -e ">>> Checking nginx configuration... \n"
echo -e ">>> Status:"
docker exec $CONTAINER_NAME nginx -t

# Check if the configuration test passed
if [ $? -eq 0 ]; then
    echo -e "\n${GREEN}Configuration is valid. Restarting nginx ...${WHITE}"
    # Restart the nginx container
    docker exec $CONTAINER_NAME nginx -s reload
    if [ $? -eq 0 ]; then
        echo -e "\n${GREEN}DONE!!!"
        exit 0
    else
        echo -e "\n${RED}FAIL!!!"
        exit 1
    fi
else
    echo -e "\n${RED}Configuration is invalid. Please fix the issues and try again!"
    echo -e "FAIL!!!"
    exit 1
fi