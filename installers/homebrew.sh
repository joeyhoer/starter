#!/usr/bin/env bash

###############################################################################
# Homebrew                                                                    #
###############################################################################

# Install Homebrew if not installed - brew.sh
if ! hash brew 2>/dev/null; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
fi

# Schedule Homebrew Updates
(crontab -l 2>/dev/null; echo "0 */6 * * * /usr/local/bin/brew update &>/dev/null") | crontab -

# Install Homebrew Bundle
brew tap Homebrew/bundle

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Make sure we arere using the latest Homebrew
brew update

# Upgrade existing packages
brew upgrade

# Install CLI tools & GUI applications
brew bundle --file=installers/homebrew/Brewfile

# Remove outdated versions from the cellar
brew cleanup && brew prune

# Remove outdated cask versions from the cellar
brew cask cleanup
