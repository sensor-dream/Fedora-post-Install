#!/bin/env bash

#
#   Сообщение-Предупреждение (Warning):  echo_w <string>
#

echo_w() {
    echo -e '\e[47;31m'"!!! $@ !!!\033[0m";
    tput sgr0;
}

#
#   Сообщение-Обычное:  echo_m <string>
#

echo_m() {
    echo -e '\e[47;30m'"!!! $@ !!!\033[0m";
    tput sgr0;
}

check_root(){

    if [ $USER != "root" ]; then
	echo_w "not root account";
	exit 1;
    fi

}

check_root;
