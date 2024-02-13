#!/bin/bash

export RAW_DIR="$1/deeph/raw_dir"
export PROCESSED_DIR="$1/deeph/processed_dir"
export CONFIG_FILE="$1/deeph/preprocess_default.ini"


cd /

mkdir -p $RAW_DIR
mkdir -p $PROCESSED_DIR

cp $1/openmx.out $RAW_DIR
cp $1/openmx.scfout $RAW_DIR

echo "---"
echo "Copied $1/openmx.out to $RAW_DIR"
echo "Copied $1/openmx.scfout to $RAW_DIR"

cat $RAW_DIR/openmx.out >> $RAW_DIR/openmx.scfout


# Replace values in INI file
sed -e "s|^raw_dir =.*$|raw_dir = $RAW_DIR|" \
    -e "s|^processed_dir =.*$|processed_dir = $PROCESSED_DIR|" \
    /home/preprocess_default.ini > $CONFIG_FILE

echo "Using config file: $CONFIG_FILE"

deeph-preprocess --config $CONFIG_FILE