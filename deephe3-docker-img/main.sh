#!/bin/bash

export RAW_DIR="/data/deeph/raw_dir"
export PROCESSED_DIR="/data/deeph/processed_dir"


cd /

mkdir -p $RAW_DIR
mkdir -p $PROCESSED_DIR
mkdir -p $SAVE_GRAPH_DIR

cp /data/openmx.out $RAW_DIR
cp /data/openmx.scfout $RAW_DIR

echo "---"
echo "Copied /data/openmx.out to $RAW_DIR"
echo "Copied /data/openmx.scfout to $RAW_DIR"

cat $RAW_DIR/openmx.out >> $RAW_DIR/openmx.scfout

## For deeph-e3
export SAVE_GRAPH_DIR="/data/deeph/save_graph_dir"
export E3_CONFIG_FILE="/data/deeph/base_default.ini"

# Replace values in INI file for deeph e3
sed -e "s|^processed_data_dir =.*$|processed_data_dir = $PROCESSED_DIR|" \
    -e "s|^save_graph_dir =.*$|save_graph_dir = $SAVE_GRAPH_DIR|" \
    -e "s|^dataset_name =.*$|dataset_name = openmx|" \
    -e "s|^DFT_data_dir =.*$|DFT_data_dir = $RAW_DIR|" \
    /home/base_default.ini > $E3_CONFIG_FILE


# echo "Using config file: $CONFIG_FILE"
echo "Using E3 config file: $E3_CONFIG_FILE"
# deeph-preprocess --config $CONFIG_FILE &&
/DeepH-E3/deephe3-preprocess.py $E3_CONFIG_FILE
cp $PROCESSED_DIR/raw_dir/* $PROCESSED_DIR/
rm -r $PROCESSED_DIR/raw_dir
