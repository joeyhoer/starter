#!/usr/bin/env bash

###############################################################################
# Python                                                                      #
###############################################################################

# pyenv *should* be installed at this point
hash pyenv 2>/dev/null || echo "Please install pyenv before continuing"

# Install latest (stable) Python
python_latest=$(pyenv install -l 2>/dev/null | awk '$1 ~ /^[0-9.]*$/ {latest=$1} END {print latest}')
pyenv install $python_latest
pyenv rehash
pyenv global $python_latest

# pip *should* be installed at this point
hash pip 2>/dev/null || echo "Please install pip before continuing"

pip install fonttools
pip install qtfaststart
pip install dnsyo --upgrade
# pip install pillow # Dependancy for visualmetrics
pip install powerline-status
