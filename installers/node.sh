#!/usr/bin/env bash

###############################################################################
# Node                                                                        #
###############################################################################

# Node and npm *should* be installed at this point
hash npm 2>/dev/null || echo "Please install npm before continuing"

# Update npm
npm update -g npm

# Install Node packages
npm install -g a11y
npm install -g autoprefixer
npm install -g browser-sync
npm install -g clean-css
npm install -g cssmin
npm install -g grunt-cli
npm install -g gulp
npm install -g html-minifier
npm install -g jscrush
npm install -g jscs
npm install -g jshint
npm install -g modernizr
npm install -g packer
npm install -g psi
npm install -g snapline
npm install -g svgo
npm install -g uglify-js
