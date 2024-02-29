#!/bin/bash

export RAW_DIR="$1/deeph/raw_dir"
export PROCESSED_DIR="$1/deeph/processed_dir"
export CONFIG_FILE="$1/deeph/preprocess_default.ini"


cd /

mkdir -p $RAW_DIR
mkdir -p $PROCESSED_DIR
mkdir -p $SAVE_GRAPH_DIR

cp $1/openmx.out $RAW_DIR
cp $1/openmx.scfout $RAW_DIR

echo "---"
echo "Copied $1/openmx.out to $RAW_DIR"
echo "Copied $1/openmx.scfout to $RAW_DIR"

cat $RAW_DIR/openmx.out >> $RAW_DIR/openmx.scfout


# Replace values in INI file for deeph
sed -e "s|^raw_dir =.*$|raw_dir = $RAW_DIR|" \
    -e "s|^processed_dir =.*$|processed_dir = $PROCESSED_DIR|" \
    /home/preprocess_default.ini > $CONFIG_FILE




# deeph-preprocess --config $CONFIG_FILE


## For deeph-e3
export SAVE_GRAPH_DIR="$1/deeph/save_graph_dir"
export E3_CONFIG_FILE="$1/deeph/base_default.ini"

# Replace values in INI file for deeph e3
sed -e "s|^processed_data_dir =.*$|processed_data_dir = $PROCESSED_DIR|" \
    -e "s|^save_graph_dir =.*$|save_graph_dir = $SAVE_GRAPH_DIR|" \
    -e "s|^dataset_name =.*$|dataset_name = openmx|" \
    /home/base_default.ini > $E3_CONFIG_FILE


echo "Using config file: $CONFIG_FILE"
echo "Using E3 config file: $E3_CONFIG_FILE"
deeph-preprocess --config $CONFIG_FILE &&
/DeepH-E3/deephe3-preprocess.py $E3_CONFIG_FILE