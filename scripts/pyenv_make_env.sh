#!/bin/bash

usage_exit() {
  echo "Usage: $0 -v version -n name [-h]" 1>&2
  exit 1
}

while getopts v:n:h OPT
do
  case $OPT in
    v) PYTHON_VERSION=$OPTARG ;;
    n) VIRTUALENV_NAME=$OPTARG ;;
    h) usage_exit ;;
    \?) usage_exit ;;
  esac
done

if [ -z "${PYTHON_VERSION}" ]; then
  echo "option -v is required!" 1>&2
  usage_exit
fi

if [ -z "${VIRTUALENV_NAME}" ]; then
  echo "option -n is required!" 1>&2
  usage_exit
fi

echo "Setup pyenv and virtualenv..."
pyenv install ${PYTHON_VERSION}
pyenv virtualenv ${PYTHON_VERSION} ${VIRTUALENV_NAME}
pyenv global ${VIRTUALENV_NAME}
echo "Done."
echo
