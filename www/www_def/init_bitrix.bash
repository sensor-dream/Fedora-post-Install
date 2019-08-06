#!/bin/env bash

ln -s $(readlink -m bitrix.conf) /etc/php-fpm.d/bitrix.conf;
