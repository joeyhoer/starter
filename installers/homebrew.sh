#!/usr/bin/env bash

###############################################################################
# Homebrew                                                                    #
###############################################################################

# Check if Homebrew is installed
hash brew 2>/dev/null || { echo >&2 "Homebrew is not installed.";  }

# Install Homebrew - brew.sh
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Schedule Homebrew Updates
(crontab -l; echo "0 */6 * * * /usr/local/bin/brew update >/dev/null 2>&1") | crontab -

# Install Homebrew apps
brew bundle installers/homebrew/Brewfile

# Install Homebrew Cask apps
brew bundle installers/homebrew/Caskfile
