#!/bin/bash

PYTHON_VERSION="3.6.5"
VIRTUALENV_NAME="NPB-DAA_dev"

APT_LIBRARIES="git mousepad gcc make openssl libssl-dev libbz2-dev libreadline-dev libsqlite3-dev tk-dev ipython3 htop atom"
PIP_LIBRARIES="numpy scipy matplotlib scikit-learn tqdm wheel ipython ipyparallel jupyter cython numba joblib autopep8"
APM_LIBRARIES="hydrogen autocomplete-python highlight-selected"

PROFILE_FILE="~/.profile"
ATOM_COFFEE="~/.atom/init.coffee"

PYBASICBAYES_GIT="https://github.com/mattjj/pybasicbayes"
PYHSMM_GIT="https://github.com/mattjj/pyhsmm"

PYENV_GIT="https://github.com/yyuu/pyenv.git"
VIRTUALENV_GIT="https://github.com/yyuu/pyenv-virtualenv.git"

while getopts rs OPT
do
  case $OPT in
    "r" ) REBOOT_FLAG="TRUE" ;;
    "s" ) SHUTDOWN_FLAG="TRUE" ;;
  esac
done

sudo echo "Get sudo password!"

echo "Update libraries..."
sudo add-apt-repository ppa:webupd8team/atom
sudo apt update
yes | sudo apt upgrade
echo "Done."
echo

echo "Install libraries..."
for LIB_NAME in ${APT_LIBRARIES}
do
  yes | sudo apt install ${LIB_NAME}
done
echo "Done."
echo

echo "Install pyenv and virtualenv..."
git clone ${PYENV_GIT} ~/.pyenv
git clone ${VIRTUALENV_GIT} ~/.pyenv/plugins/pyenv-virtualenv
echo "Done."
echo

echo "Setting profile of pyenv and virtualenv..."
echo '# pyenv and virtualenv commands.' >> ${PROFILE_FILE}
echo 'export PYENV_ROOT=$HOME/.pyenv' >> ${PROFILE_FILE}
echo 'export PATH=$PYENV_ROOT/bin:$PATH' >> ${PROFILE_FILE}
echo 'eval "$(pyenv init -)"' >> ${PROFILE_FILE}
echo 'eval "$(pyenv virtualenv-init -)"' >> ${PROFILE_FILE}
source ${PROFILE_FILE}
echo "Done."
echo

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
echo 'process.env.PATH = ["/home/ema/.pyenv/shims/python", process.env.PATH].join(":")' >> ${ATOM_COFFEE}
yes | python -m pip install ipykernel
yes | python -m ipykernel install --user
for ${LIB_NAME} in ${APM_LIBRARIES}
do
  yes | apm install ${LIB_NAME}
done
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

if ["${REBOOT_FLAG}" = "TRUE"];
then
  echo "reboot...."
  reboot
fi

if ["${SHUTDOWN_FLAG}" = "TRUE"];
then
  echo "shutdow..."
  shutdown -h now
fi
