#/bin/bash

set -e

echo "Starting to install"

echo "--------------------------------------------------------"
echo "Creating data path"
mkdir -p data/jenkins
echo "Data has been created"

echo "--------------------------------------------------------"
echo "Start up containers"
docker-compose up -d jenkins

echo "--------------------------------------------------------"
echo "All done and ready to use"