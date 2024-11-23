#!/bin/env bash

if [[ -z $@ ]]; then
    path="$(dirname $(readlink -m $0))";
else
    path="${@%/}";
fi

echo "Find fale in ${path}";

if [[ ! -d "${path}" ]]; then
    echo "Not found path: ${path}";
    exit 1;
fi

multiple_cmd() {
    if [[ -x "${@}" ]]; then
	if grep -aiHsrE -m 1 '^#!(/usr/|/)[sb]+in(/env[[:space:]]+|/)(bash|sh|py[thon]+|js|perl|php)$' "${@}"; then
	    sudo chmod +x "${@}"
            echo "+x ${@}";
        else
            sudo chmod -x "${@}"
            echo "-x ${@}";
        fi
    fi
}

export -f multiple_cmd

find "${path}" -type f -exec bash -c 'multiple_cmd "$0"' {} \;
