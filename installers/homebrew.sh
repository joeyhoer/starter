#!/usr/bin/env bash

###############################################################################
# Homebrew                                                                    #
###############################################################################

# Install Homebrew if not installed - brew.sh
if ! hash brew 2>/dev/null; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
fi

# Schedule Homebrew Updates
(crontab -l 2>/dev/null; echo "0 */6 * * * /usr/local/bin/brew update >/dev/null 2>&1") | crontab -

# Install command-line tools using Homebrew
source installers/homebrew/Brewfile

# Install GUI applications with Homebrew Cask
source installers/homebrew/Caskfile
