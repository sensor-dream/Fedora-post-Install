#!/bin/env bash

. docker_stop_centos_lap_container.bash

docker container commit $(docker ps -a -q -f name=centos-lap) centos-lap
docker image save centos-lap -o /mnt/sda/Development/docker_share/images/lap/centos-lap.image

. docker_start_centos_lap_container.bash

#docker rmi -f $(docker images | grep "^<none>" | awk "{print $3}")
#docker volume rm $(docker volume ls -f dangling=true -q)
#docker image prune

