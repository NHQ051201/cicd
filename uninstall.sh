#/bin/bash

echo "Starting to uninstall"

# docker-compose down -v
./dockerclearall.sh
sudo rm -rf data artifactory*

echo "Done"