#!/bin/bash

# mkdir logs

sh scripts/pyenv_make_env.sh

sh scripts/pip.sh

sh scripts/atom.sh

sh scripts/git.sh

echo "finished!!"
