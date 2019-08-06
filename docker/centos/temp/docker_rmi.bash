#!/bin/env bash

#docker rmi -f $(docker images | grep "$@" | awk "{print $3}")

#docker rmi -f $(docker images | grep . | awk "{print $3}")

docker rmi -f $(docker images | grep "^<none>" | awk "{print $3}")
docker volume rm $(docker volume ls -f dangling=true -q)
docker image prune

