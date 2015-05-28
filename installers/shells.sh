#!/usr/bin/env bash

###############################################################################
# Shells                                                                      #
###############################################################################

# Add shells installed by Homebrew
sudo bash -c "which zsh bash >> /etc/shells"

# Set default shell
chsh -s $(which zsh)

# Download Antigen
curl -L https://raw.githubusercontent.com/zsh-users/antigen/master/antigen.zsh > antigen.zsh
source antigen.zsh

antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle powerline/powerline powerline/bindings/zsh
