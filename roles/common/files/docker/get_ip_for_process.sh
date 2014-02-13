#!/bin/bash
if [[ $# -eq 0 ]] ; then
    echo 'Invalid argument: I need the name of the container.'
    exit 1
fi

sudo docker inspect -format '{{ .NetworkSettings.IPAddress }}' $1