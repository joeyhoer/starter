#!/usr/bin/env bash

###############################################################################
# Adobe                                                                       #
###############################################################################

open -a "Creative Cloud.app"

# Hide crufty Application folders
sudo chflags -v hidden /Applications/Adobe
sudo chflags -v hidden /Applications/Adobe*/Configuration
sudo chflags -v hidden /Applications/Adobe*/Resources
sudo chflags -v hidden /Applications/Utilities/Adobe*

# Remove Legal cruft
rm -rf /Applications/Adobe*/Legal* 2>/dev/null

# Remove uninstaller aliases
rm /Applications/Adobe*/Uninstall* 2>/dev/null
