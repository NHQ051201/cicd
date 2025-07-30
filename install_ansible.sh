#!/bin/bash

set -e

echo "Starting to install"

echo "--------------------------------------------------------"
echo "Creating data path"
mkdir -p ~/ansible_config
echo "Data has been created"

echo "--------------------------------------------------------"
echo "Setup command alias"
sudo sh -c 'cat << "EOF" > /usr/local/bin/d-ansible
#!/bin/sh
docker exec -i ansible bash -c "$*"
EOF'
sudo chmod +x /usr/local/bin/d-ansible

echo "--------------------------------------------------------"
echo "Start up containers"
cd ansible
docker-compose up -d

echo "--------------------------------------------------------"
echo "Ansible is installed and ready"