#!/bin/bash

PYTHON_VERSION="3.6.5"
VIRTUALENV_NAME="dev"

echo "Setup pyenv and virtualenv..."
pyenv install ${PYTHON_VERSION}
pyenv virtualenv ${PYTHON_VERSION} ${VIRTUALENV_NAME}
pyenv global ${VIRTUALENV_NAME}
echo "Done."
echo
