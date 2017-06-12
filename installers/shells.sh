#!/usr/bin/env bash

###############################################################################
# Shells
###############################################################################

# Add shells installed by Homebrew
sudo bash -c "which zsh bash >> /etc/shells"

# Set default shell for the current user
chsh -s $(which zsh)

# Create antigen directory
mkdir -p ~/.antigen
mkdir -p ~/.antigen/themes

# Download Antigen
curl -L https://raw.githubusercontent.com/zsh-users/antigen/master/antigen.zsh > ~/.antigen/antigen.zsh
source ~/.antigen/antigen.zsh
