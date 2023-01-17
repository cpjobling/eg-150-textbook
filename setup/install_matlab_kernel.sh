#!/bin/zsh

MATLAB_HOME=/Applications/MATLAB_R2022b.app
EG_150=$HOME/code/src/github.com/cpjobling/eg-150-textbook

# Set up for jupyter with rise and jupyter-book
cd $EG_150
conda deactivate
conda env remove -n eg-150-textbook
conda update conda
conda create -n eg-150-textbook python=3.10 anaconda
conda init zsh
conda activate eg-150-textbook
pip install -U jupyter-book
pip install -U jupytext
conda install rise

# Set up Python-MATLAB bridge and matlab_kernel
cd $MATLAB_HOME/extern/engines/python
python setup.py install
pip install matlab_kernel
python -m matlab_kernel install --user

# Add rise
pip install -U rise

# Add ghp-import
pip install -U ghp-import



cd $EG_150

# Save environment and exit eg-150-textbook
conda env export > environment.yml
conda deactivate



