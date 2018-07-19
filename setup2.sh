#!/bin/bash

PYTHON_VERSION="3.6.5"
VIRTUALENV_NAME="dev"

PIP_LIBRARIES="numpy scipy matplotlib scikit-learn tqdm wheel ipython jupyter cython joblib autopep8"
APM_LIBRARIES="autocomplete-python highlight-selected hydrogen"

ATOM_COFFEE="${HOME}/.atom/init.coffee"

SPHFILE_GIT="https://github.com/mcfletch/sphfile"
FEATURES_GIT="https://github.com/jameslyons/python_speech_features"
PYBASICBAYES_GIT="https://github.com/mattjj/pybasicbayes"
PYHSMM_GIT="https://github.com/mattjj/pyhsmm"

echo "Setup pyenv and virtualenv..."
pyenv install ${PYTHON_VERSION}
pyenv virtualenv ${PYTHON_VERSION} ${VIRTUALENV_NAME}
pyenv global ${VIRTUALENV_NAME}
echo "Done."
echo

echo "Install Python libraries..."
yes | pip install --upgrade pip
for LIB_NAME in ${PIP_LIBRARIES}
do
  yes | pip install --no-cache-dir ${LIB_NAME}
done
echo "Done."
echo

echo "Setup atom editor..."
mkdir -p ${HOME}/.atom
echo 'process.env.PATH = ["'${HOME}'/.pyenv/shims/python", process.env.PATH].join(":")' >> ${ATOM_COFFEE}
yes | python -m pip install ipykernel
yes | python -m ipykernel install --user
for LIB_NAME in ${APM_LIBRARIES}
do
  yes | apm install ${LIB_NAME}
done
echo "Done."
echo

echo "Installing sphfile..."
git clone ${SPHFILE_GIT}
cd sphfile
python setup.py install
cd ../
rm -rf sphfile
echo "Done."
echo

echo "Installing python_speech_features..."
git clone ${FEATURES_GIT}
cd python_speech_features
python setup.py install
cd ../
rm -rf python_speech_features
echo "Done."
echo

echo "Installing pybasicbayes..."
git clone ${PYBASICBAYES_GIT}
cd pybasicbayes
python setup.py install
cd ../
rm -rf pybasicbayes
echo "Done."
echo

echo "Installing pyhsmm..."
git clone ${PYHSMM_GIT}
cd pyhsmm
python setup.py install
cd ../
rm -rf pyhsmm
echo "Done."
echo

echo "Finished!!!!"
echo
