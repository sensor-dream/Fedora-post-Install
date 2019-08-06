#!/bin/env bash

ssudd='';

[[ "$(echo $USER)" != 'root'  ]] && ssudd='sudo';

$ssudd systemctl stop docker-centos-lap.service

$ssudd systemctl disable docker-centos-lap.service

$ssudd rm /usr/lib/systemd/system/docker-centos-lap.service

$ssudd systemctl daemon-reload
