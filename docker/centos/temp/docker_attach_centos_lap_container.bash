#!/bin/env bash

docker exec -i -t  $(docker ps -a -q -f name=centos-lap) /bin/bash
