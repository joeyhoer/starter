#!/usr/bin/env bash

###############################################################################
# Xcode
###############################################################################

# Install Xcode Command Line Tools
if ! $(xcode-select -p &>/dev/null); then
  xcode-select --install &>/dev/null

  # Wait until the Xcode Command Line Tools are installed
  until $(xcode-select -p &>/dev/null); do
    sleep 5
  done
fi

# Accept the Xcode/iOS license agreement
if ! $(sudo xcodebuild -license status); then
  sudo xcodebuild -license accept
fi

# Install additional required components
# /Applications/Xcode.app/Contents/MacOS/Xcode -installComponents
for pkg in /Applications/Xcode.app/Contents/Resources/Packages/*.pkg; do
  sudo installer -pkg "$pkg" -target /
done
