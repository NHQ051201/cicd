#/bin/bash

echo "Starting to uninstall"

docker-compose down -v
rm -rf data

echo "Done"