#!/bin/env bash

# docker container commit $(docker ps -a -q -f name=centos) centos
# docker image save centos -o /mnt/sda/Development/docker_share/images/centos.image

# docker rmi -f $(docker images | grep "^<none>" | awk "{print $3}")
# docker volume rm $(docker volume ls -f dangling=true -q)
# docker image prune

