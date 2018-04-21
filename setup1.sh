#!/bin/bash

APT_LIBRARIES="git mousepad gcc make openssl libssl-dev libbz2-dev libreadline-dev libsqlite3-dev tk-dev htop atom"

PROFILE_FILE="${HOME}/.profile"

PYENV_GIT="https://github.com/yyuu/pyenv.git"
VIRTUALENV_GIT="https://github.com/yyuu/pyenv-virtualenv.git"

sudo echo "Get sudo password!"

echo "Update libraries..."
yes | sudo add-apt-repository ppa:webupd8team/atom
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
git clone ${PYENV_GIT} ${HOME}/.pyenv
git clone ${VIRTUALENV_GIT} ${HOME}/.pyenv/plugins/pyenv-virtualenv
echo "Done."
echo

echo "Setting profile of pyenv and virtualenv..."
touch ${PROFILE_FILE}
echo '# pyenv and virtualenv commands.' >> ${PROFILE_FILE}
echo 'export PYENV_ROOT=$HOME/.pyenv' >> ${PROFILE_FILE}
echo 'export PATH=$PYENV_ROOT/bin:$PATH' >> ${PROFILE_FILE}
echo 'eval "$(pyenv init -)"' >> ${PROFILE_FILE}
echo 'eval "$(pyenv virtualenv-init -)"' >> ${PROFILE_FILE}
echo "Done."
echo

echo "Finished setup1.sh!!"
echo "Please run setup2.sh"
exec ${SHELL} -l
