#!/bin/bash

ATOM_COFFEE="${HOME}/.atom/init.coffee"

echo "Setup atom editor..."
mkdir -p ${HOME}/.atom
echo 'process.env.PATH = ["'${HOME}'/.pyenv/shims/python", process.env.PATH].join(":")' >> ${ATOM_COFFEE}
yes | python -m pip install ipykernel
yes | python -m ipykernel install --user
yes | apm install --packages-file package_lists/apm_packages.txt
echo "Done."
echo
