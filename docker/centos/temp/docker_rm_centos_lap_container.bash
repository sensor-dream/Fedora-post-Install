#!/bin/env bash

. docker_stop_centos_lap_container.bash

docker rm  $(docker ps -a -q -f name=centos-lap)

. docker_remove_centos_lap_service.bash
