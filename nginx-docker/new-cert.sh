#!/bin/bash

# usage function
function usage {
    local domain_regex="^(\*\.)?([a-zA-Z0-9]([-a-zA-Z0-9]*[a-zA-Z0-9])?\.)+[a-zA-Z]{2,}$"

    # check quantity of params
    if [ $# -ne 1 ]; then
        echo "Usage: sudo ./new-cert.sh <domain name>"
        exit 1
    else
        # check if param is a valid domain or wildcard domain
        if [[ ! $1 =~ $domain_regex ]]; then
            echo "Invalid domain, subdomain, or wildcard domain name: $1"
            exit 1
        else
            echo "Valid domain: $1"
        fi
    fi
}

# begin checking params
usage "$@"

# Check if certbot container is running
if ! docker ps --format '{{.Names}}' | grep -q '^certbot$'; then
    echo "Error: certbot container is not running."
    exit 1
fi

# Run certbot command inside the running container
docker exec -it certbot certbot certonly \
--manual \
--preferred-challenges=dns \
--server https://acme-v02.api.letsencrypt.org/directory \
--agree-tos \
--no-eff-email \
--email kiet.vo@dision.tech \
-d "$1"

# Notify user
echo "Certificate request submitted for domain: $1."
echo "Please remember to add the TXT record for DNS validation if prompted."
