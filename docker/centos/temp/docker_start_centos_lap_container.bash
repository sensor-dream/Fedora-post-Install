#!/bin/env bash

# docker start  $(docker ps -a -q -f name=centos-lap)

ssudd='';

[[ "$(echo $USER)" != 'root'  ]] && ssudd='sudo';

$ssudd systemctl start docker-centos-lap.service
