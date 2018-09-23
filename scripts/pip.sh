#!/bin/bash

echo "Install Python libraries..."
yes | pip install --upgrade pip
yes | pip install -r package_lists/pip_packages.txt
echo "Done."
echo
