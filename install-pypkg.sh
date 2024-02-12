#!/bin/bash

# install miniconda with python 3.9
rm -r $HOME/miniconda
rm Miniconda3-py39_4.10.3-Linux-x86_64.sh

wget https://repo.anaconda.com/miniconda/Miniconda3-py39_4.10.3-Linux-x86_64.sh
bash Miniconda3-py39_4.10.3-Linux-x86_64.sh -b -p $HOME/miniconda

# initialize conda
. $HOME/miniconda/bin/activate 
conda init

# install packages by conda
conda install -y numpy
conda install -y scipy
conda install -y pytorch==1.9.1 torchvision==0.10.1 torchaudio==0.9.1 cpuonly -c pytorch
conda install -y pytorch-geometric=1.7.2 -c rusty1s -c conda-forge
conda install -y pymatgen -c conda-forge

# install packages by pip
pip install --no-input e3nn==0.3.5
pip install --no-input h5py
pip install --no-input tensorboard
pip install --no-input pathos
pip install --no-input psutil