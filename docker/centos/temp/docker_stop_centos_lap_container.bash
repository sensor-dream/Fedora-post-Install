#!/bin/env bash

# docker stop  $(docker ps -a -q -f name=centos-lap)

ssudd='';

[[ "$(echo $USER)" != 'root'  ]] && ssudd='sudo';

$ssudd systemctl stop docker-centos-lap.service
