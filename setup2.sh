#!/bin/bash

# mkdir logs

sh scripts/pyenv_make_env.sh -v 3.6.5 -n dev

sh scripts/pip.sh

sh scripts/atom.sh

sh scripts/git.sh

cp config_files/.latexmkrc ~/

echo "finished!!"
