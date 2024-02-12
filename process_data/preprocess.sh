#!/bin/bash

mkdir -p $1
cp openmx.out $1
cp openmx.scfout $1

cd $1
cat openmx.out >> openmx.scfout


export CONFIG_FILE="/workspaces/deepH/process_data/preprocess_default.ini"


deeph-preprocess --config $CONFIG_FILE 