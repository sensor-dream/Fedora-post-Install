#!/bin/env bash

ssudd='';

[[ "$(echo $USER)" != 'root'  ]] && ssudd='sudo';

$ssudd cp docker-centos-lap.service /usr/lib/systemd/system/docker-centos-lap.service

$ssudd systemctl daemon-reload

$ssudd systemctl enable docker-centos-lap.service

$ssudd systemctl start docker-centos-lap.service
