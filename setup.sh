#!/bin/bash

# mkdir logs

sh scripts/apt.sh

sh scripts/pyenv_setup.sh

sh scripts/pyenv_make_env.sh

sh scripts/pip.sh

sh scripts/atom.sh

sh scripts/git.sh

echo "finished!!"
