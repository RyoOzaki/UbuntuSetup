#!/bin/bash

PYTHON_VERSION="3.6.5"
VIRTUALENV_NAME="dev"

ATOM_COFFEE="${HOME}/.atom/init.coffee"

echo "Setup pyenv and virtualenv..."
pyenv install ${PYTHON_VERSION}
pyenv virtualenv ${PYTHON_VERSION} ${VIRTUALENV_NAME}
pyenv global ${VIRTUALENV_NAME}
echo "Done."
echo


echo "Install Python libraries..."
yes | pip install --upgrade pip
yes | pip install -r pip_packages.txt
echo "Done."
echo

echo "Setup atom editor..."
mkdir -p ${HOME}/.atom
echo 'process.env.PATH = ["'${HOME}'/.pyenv/shims/python", process.env.PATH].join(":")' >> ${ATOM_COFFEE}
yes | python -m pip install ipykernel
yes | python -m ipykernel install --user
yes | apm install --packages-file apm_packages.txt
echo "Done."
echo

echo "Install Python libraries from git repositories..."
for GIT_URL in `cat git_packages.txt`
do
  git clone ${GIT_URL} git_work
  cd git_work
  python setup.py install
  cd ../
  rm -rf git_work
done
echo "Done."
echo

echo "Finished!!!!"
echo
