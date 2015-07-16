#!/usr/bin/env bash

###############################################################################
# Python                                                                      #
###############################################################################

# pyenv *should* be installed at this point
hash pyenv 2>/dev/null || echo "Please install pyenv before continuing"

# Install latest (stable) Python
python2_latest=$(pyenv install -l 2>/dev/null | awk '$1 ~ /^2[0-9.]*$/ {latest=$1} END {print latest}')
python_latest=$(pyenv install -l 2>/dev/null | awk '$1 ~ /^[0-9.]*$/ {latest=$1} END {print latest}')
pyenv install $python2_latest
pyenv install $python_latest
pyenv rehash
pyenv global $python2_latest

# pip *should* be installed at this point
hash pip 2>/dev/null || echo "Please install pip before continuing"

# Upgrade pip
pip install --upgrade pip

pip install fonttools
pip install qtfaststart
pip install dnsyo --upgrade
# pip install pillow # Dependancy for visualmetrics
pip install powerline-status
