#/bin/bash

set -e

echo "Starting to install nginx"

echo "--------------------------------------------------------"
echo "Start up containers"
cd nginx-docker
docker-compose up -d nginx certbot

echo "--------------------------------------------------------"
echo "All done and ready to use"