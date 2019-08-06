#!/bin/env bash

#docker image import /mnt/sda/Development/docker_share/images/lap/centos-lap.image centos-lap:latest
docker image load < /mnt/sda/Development/docker_share/images/lap/centos-lap.image

. docker_run_centos_lap_container.bash
