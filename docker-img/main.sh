#!/bin/bash

cd /

mkdir /home/raw_dir
mkdir /home/processed_dir

cp $1/openmx.out /home/raw_dir
cp $1/openmx.scfout /home/raw_dir

echo "the folder is $1"

cat /home/raw_dir/openmx.out >> /home/raw_dir/openmx.scfout

export CONFIG_FILE="/home/preprocess_default.ini"

deeph-preprocess --config $CONFIG_FILE 

cp -r /home/processed_dir $1