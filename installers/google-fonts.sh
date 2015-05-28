#!/usr/bin/env bash

###############################################################################
# Google Fonts                                                                #
###############################################################################

# Install Google Fonts
mkdir -p "/Library/Fonts/Google Fonts"
git clone https://github.com/google/fonts.git "/Library/Fonts/Google Fonts"

# Schedule Google Fonts Updates
(crontab -l; echo "0 */6 * * * sh -c \"" \
    "cd '/Library/Fonts/Google Fonts' && git pull && git clean -dfqx" \
    "\" >/dev/null 2>&1") | crontab -
