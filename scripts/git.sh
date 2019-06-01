#!/bin/bash

echo "Install Python libraries from git repositories..."
for GIT_URL in `cat package_lists/git_packages.txt`
do
  git clone ${GIT_URL} git_work
  cp scripts/scipy_logsumexp_import_fix.sh git_work/
  cd git_work
  sh scipy_logsumexp_import_fix.sh
  rm scipy_logsumexp_import_fix.sh
  python setup.py install
  cd ../
  rm -rf git_work
done
echo "Done."
echo
