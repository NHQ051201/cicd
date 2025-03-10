dockerclearall () 
{ 
    docker ps --format '{{.Names}}' | xargs -I {} bash -c 'echo "removing {} ..."; docker update --restart=no "{}"; docker stop -t1 "{}"; docker rm -f "{}"';
    yes | docker container prune;
    yes | docker network prune;
    [[ -z $keepvolume ]] && yes | docker volume prune
    docker rmi -f $(docker images -aq)
}

dockerclearall
