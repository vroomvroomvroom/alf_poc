#!/bin/bash
sudo docker rmi $(sudo docker images --filter "dangling=true" -q --no-trunc)
sudo docker rmi $(sudo docker images | grep "none" | awk '/ / { print $3 }')

source env_file/.env; sudo docker-compose build --no-cache
source env_file/.env; sudo docker-compose up

