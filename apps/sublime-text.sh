#!/usr/bin/env bash

###############################################################################
# Sublime Text
###############################################################################

LOCAL_PATH='apps/sublime'

# Install Package Control
cd ~/Library/Application\ Support/Sublime\ Text\ 3/Installed\ Packages && { curl -sLO https://packagecontrol.io/Package\ Control.sublime-package ; cd -; }

# Install Sublime Text settings
cp -r ${LOCAL_PATH}/* ~/Library/Application\ Support/Sublime\ Text*/Packages/User/ 2>/dev/null

# Set Sublime Text as default plain text editor
duti -s com.sublimetext.3 public.plain-text all
duti -s com.sublimetext.3 net.daringfireball.markdown all
