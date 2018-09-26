#!/bin/bash

# mkdir logs

sh scripts/apt.sh

sh scripts/pyenv_install.sh

echo "Run the following commando to continue setup!!"
echo "source ~/.profile; sh setup2.sh"
