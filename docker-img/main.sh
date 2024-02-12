#!/bin/bash

cd /home/
mkdir raw_dir
mkdir processed_dir

cp $1/openmx.out ./raw_dir
cp $1/openmx.scfout ./raw_dir

cat ./raw_dir/openmx.out >> ./raw_dir/openmx.scfout

export CONFIG_FILE="/home/preprocess_default.ini"

deeph-preprocess --config $CONFIG_FILE 