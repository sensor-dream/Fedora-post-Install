#!/bin/bash

echo "NTFSFIX apply /dev/$@"
ntfsfix "/dev/$@"
