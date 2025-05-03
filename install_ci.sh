#/bin/bash

echo "Starting to install"

echo "--------------------------------------------------------"
echo "Creating data path"
mkdir -p data/jenkins data/nginx
echo "Data has been created"

echo "--------------------------------------------------------"
echo "Start up containers"
docker-compose up jenkins nginx -d

echo "--------------------------------------------------------"
echo "All done and ready to use"