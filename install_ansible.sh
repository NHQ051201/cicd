#!/bin/bash

set -e

echo "Starting to install"

echo "--------------------------------------------------------"
echo "Creating data path"
mkdir -p ~/ansible_config
echo "Data has been created"

echo "--------------------------------------------------------"
echo "Setup command alias"
FUNC_NAME="d-ansible"
BASHRC="$HOME/.bashrc"
if ! grep -q "$FUNC_NAME()" "$BASHRC"; then
  cat << 'EOF' >> "$BASHRC"

# Docker Ansible shortcut
d-ansible() {
  docker exec -it ansible bash -c "$*"
}
EOF
  echo "Alias function '$FUNC_NAME' added to $BASHRC"
else
  echo "Alias function '$FUNC_NAME' already exists in $BASHRC"
fi

echo "--------------------------------------------------------"
echo "Start up containers"
cd ansible
docker-compose up -d

echo "--------------------------------------------------------"
echo "Ansible is installed and ready"