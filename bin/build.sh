#!/bin/bash
#sudo docker rmi $(sudo docker images --filter "dangling=true" -q --no-trunc)
#sudo docker rmi $(sudo docker images | grep "none" | awk '/ / { print $3 }')
source `git rev-parse --show-toplevel`/env_file/.env;
cd `git rev-parse --show-toplevel`
source env_file/.env ; rm alf/alf_options; envsubst < "alf/alf_options.opt" > alf/alf_options
 sudo docker-compose build
 sudo docker-compose up

