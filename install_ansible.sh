#!/bin/bash

echo "Starting to install"

echo "--------------------------------------------------------"
echo "Creating data path"
mkdir -p ~/ansible_config
echo "Data has been created"

echo "--------------------------------------------------------"
echo "Start up containers"
cd ansible
docker-compose up -d

echo "--------------------------------------------------------"
echo "Ansible is installed and ready"