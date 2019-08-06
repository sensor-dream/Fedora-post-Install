#!/bin/env bash

echo "$@" | jq '."results"[]["name"]' | sort
