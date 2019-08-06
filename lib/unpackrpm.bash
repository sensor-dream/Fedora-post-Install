#!/bin/env bash

rpm2cpio "$1" | cpio -idmv
