#!/usr/bin/env bash

###############################################################################
# Google Fonts
###############################################################################

# Install Google Fonts
GOOGLE_FONTS_DIR='/Library/Fonts/Google Fonts'
mkdir -p "$GOOGLE_FONTS_DIR"
if [ ! -d "$GOOGLE_FONTS_DIR"/.git ]; then
  git clone --depth 1 https://github.com/google/fonts.git "$GOOGLE_FONTS_DIR"
fi

# Schedule Google Fonts Updates
read -d '' cron_entry <<-EOF
0 */6 * * * sh -c 'cd "${GOOGLE_FONTS_DIR}" && git fetch -fp --depth 1 && \
git reset --hard @{upstream} && git clean -dfx' &>/dev/null
EOF
if ! crontab -l | fgrep "$cron_entry" >/dev/null; then
  (crontab -l 2>/dev/null; echo "$cron_entry") | \
    crontab -
fi
