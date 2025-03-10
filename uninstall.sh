#/bin/bash

echo "Starting to uninstall"

docker-compose down -v
sudo rm -rf data artifactory*
# ./dockerclearall.sh

echo "Done"