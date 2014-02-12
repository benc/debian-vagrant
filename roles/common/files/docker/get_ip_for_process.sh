#!/bin/bash
if [[ $# -eq 0 ]] ; then
    echo 'Invalid argument: I need the name of the container.'
    exit 1
fi

docker_id=$(docker ps | grep "  $1  " | awk '{print $1}')
sudo docker inspect -format '{{ .NetworkSettings.IPAddress }}' $docker_id