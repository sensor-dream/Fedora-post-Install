#!/bin/env bash

docker stop  $(docker ps -a -q -f name=centos-lap)
docker rm  $(docker ps -a -q -f name=centos-lap)

# docker rmi -f $(docker images | grep "$@" | awk "{print $3}")
# docker rm -f $(docker ps -a | grep . | awk "{print $3}")
