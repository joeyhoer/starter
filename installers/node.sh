#!/usr/bin/env bash

###############################################################################
# Node                                                                        #
###############################################################################

# Node and npm *should* be installed at this point
hash npm 2>/dev/null || echo "Please install npm before continuing"

# Install Node packages
npm install -g a11y
npm install -g autoprefixer
npm install -g browser-sync
npm install -g grunt-cli
npm install -g jscrush
npm install -g packer
npm install -g svgo
npm install -g uglify-js
npm install -g cssmin
npm install -g psi
