#!/usr/bin/env bash

###############################################################################
# Node                                                                        #
###############################################################################

# Node and npm *should* be installed at this point
hash npm 2>/dev/null || echo "Please install npm before continuing"

# Install Node packages
sudo npm install -g autoprefixer
sudo npm install -g browser-sync
sudo npm install -g grunt-cli
sudo npm install -g jscrush
sudo npm install -g packer
sudo npm install -g svgo
sudo npm install -g uglify-js
