#!/usr/bin/env bash

###############################################################################
# Transmission
###############################################################################

## General

# Automatically size window to fit all transfers
defaults write org.m0k.transmission AutoSize -bool true

# Download & Upload Badges
defaults write org.m0k.transmission BadgeDownloadRate -bool false
defaults write org.m0k.transmission BadgeUploadRate   -bool false

# Prompt user for removal of active transfers only when downloading
defaults write org.m0k.transmission CheckRemoveDownloading -bool true

# Prompt user for quit with active transfers only when downloading
defaults write org.m0k.transmission CheckQuitDownloading -bool true


## Transfers

# Default download location
defaults write org.m0k.transmission DownloadLocationConstant -bool true
defaults write org.m0k.transmission DownloadChoice -string "Constant"
defaults write org.m0k.transmission DownloadFolder -string "${HOME}/Downloads"

# Set incomplete downloads location
defaults write org.m0k.transmission UseIncompleteDownloadFolder -bool true
defaults write org.m0k.transmission IncompleteDownloadFolder -string "${HOME}/Downloads/Torrents"

# Hide incomplete downloads folder
mkdir -p "${HOME}/Downloads/Torrents"
sudo chflags -h hidden "${HOME}/Downloads/Torrents"

# Don’t prompt for confirmation before downloading
defaults write org.m0k.transmission DownloadAsk -bool false
defaults write org.m0k.transmission MagnetOpenAsk -bool false

# Trash original torrent files
defaults write org.m0k.transmission DeleteOriginalTorrent -bool true

# Display window when opening a torrent file
defaults write org.m0k.transmission DownloadAskMulti -bool true
defaults write org.m0k.transmission DownloadAskManual -bool true

# Automatic Import
defaults write org.m0k.transmission AutoImport -bool true
defaults write org.m0k.transmission AutoImportDirectory -string "$HOME/Downloads/"


## Network

# Randomize port on launch
defaults write org.m0k.transmission RandomPort -bool true


## Startup

# Donate message
defaults write org.m0k.transmission WarningDonate -bool false

# Legal disclaimer
defaults write org.m0k.transmission WarningLegal -bool false


## View

# Status bar
defaults write org.m0k.transmission StatusBar -bool true

# Small view
defaults write org.m0k.transmission SmallView -bool true

# Pieces bar
defaults write org.m0k.transmission PiecesBar -bool false

# Pieces bar
defaults write org.m0k.transmission FilterBar -bool true

# Availability
defaults write org.m0k.transmission DisplayProgressBarAvailable -bool false
