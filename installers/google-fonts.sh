#!/usr/bin/env bash

###############################################################################
# Google Fonts                                                                #
###############################################################################

# Install Google Fonts
GOOGLE_FONTS_DIR='/Library/Fonts/Google Fonts'
mkdir -p "$GOOGLE_FONTS_DIR"
if [ ! -d "$GOOGLE_FONTS_DIR"/.git ]; then
  git clone https://github.com/google/fonts.git "$GOOGLE_FONTS_DIR"
fi

# Schedule Google Fonts Updates
(crontab -l 2>/dev/null; echo "0 */6 * * * sh -c \"" \
    "cd '$GOOGLE_FONTS_DIR' && git fetch -fp && git reset --hard @{upstream}" \
    "&& git clean -dfx\" &>/dev/null") | crontab -
