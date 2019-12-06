#!/bin/bash

PROFILE_FILE="${HOME}/.profile"

PYENV_GIT="https://github.com/yyuu/pyenv.git"
VIRTUALENV_GIT="https://github.com/yyuu/pyenv-virtualenv.git"

echo "Install pyenv and virtualenv..."
git clone ${PYENV_GIT} ${HOME}/.pyenv
git clone ${VIRTUALENV_GIT} ${HOME}/.pyenv/plugins/pyenv-virtualenv
echo "Done."
echo

echo "Setting profile of pyenv and virtualenv..."
echo >> ${PROFILE_FILE}
echo '# pyenv commands.' >> ${PROFILE_FILE}
echo 'export PYENV_ROOT=${HOME}/.pyenv' >> ${PROFILE_FILE}
echo 'if [ -d "${PYENV_ROOT}" ]; then' >> ${PROFILE_FILE}
echo '    export PATH=${PYENV_ROOT}/bin:$PATH' >> ${PROFILE_FILE}
echo '    eval "$(pyenv init -)"' >> ${PROFILE_FILE}
echo '    eval "$(pyenv virtualenv-init -)"' >> ${PROFILE_FILE}
echo 'fi' >> ${PROFILE_FILE}

echo "Done."
