#!/usr/bin/env bash

###############################################################################
# Homebrew
###############################################################################

# Install Homebrew if not installed - brew.sh
if ! hash brew 2>/dev/null; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
fi

# Schedule Homebrew Updates
# This is better than HOMEBREW_AUTO_UPDATE_SECS
# Consider disabling auto-updates with
# export HOMEBREW_NO_AUTO_UPDATE=1
cron_entry='0 */6 * * * /usr/local/bin/brew update &>/dev/null'
if ! crontab -l | fgrep "$cron_entry" >/dev/null; then
  (crontab -l 2>/dev/null; echo "$cron_entry") | \
    crontab -
fi

# Install Homebrew Bundle
brew tap Homebrew/bundle

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Make sure we are using the latest Homebrew
brew update

# Upgrade existing packages
brew upgrade

# Install CLI tools & GUI applications
brew bundle --file=installers/homebrew/Brewfile

# Remove outdated versions from the cellar including casks
brew cleanup && brew prune
