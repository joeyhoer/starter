#!/usr/bin/env bash

###############################################################################
# Python
###############################################################################

# pyenv *should* be installed at this point
hash pyenv 2>/dev/null || echo "Please install pyenv before continuing"

# Install latest (stable) Python
python2_latest=$(pyenv install -l 2>/dev/null | awk '$1 ~ /^2[0-9.]*$/ {latest=$1} END {print latest}')
python_latest=$(pyenv install -l 2>/dev/null | awk '$1 ~ /^[0-9.]*$/ {latest=$1} END {print latest}')
pyenv install --skip-existing $python2_latest
pyenv install --skip-existing $python_latest
pyenv rehash
pyenv global $python2_latest

# pip *should* be installed at this point
hash pip 2>/dev/null || echo "Please install pip before continuing"

pip_packages=(
  pip
  fonttools
  qtfaststart
  dnsyo
  powerline-status
)

# Loop through each package individally because
# any errors will stop all installations
for package in "${pip_packages[@]}"; do
  pip install --upgrade "$package"
done
