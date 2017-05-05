#!/usr/bin/env bash

###############################################################################
# Node                                                                        #
###############################################################################

# Node and yarn *should* be installed at this point
hash node 2>/dev/null || echo "Please install node before continuing"
hash yarn 2>/dev/null || echo "Please install yarn before continuing"

# Set global install path
yarn config set prefix '/usr/local/'

# Install Node packages
node_packages=(
  a11y
  autoprefixer
  babili
  browser-sync
  clean-css
  cssmin
  grunt-cli
  gulp
  html-minifier
  jscrush
  jscs
  jshint
  lebab
  modernizr
  packer
  psi
  snapline
  stylelint
  svgo
  uglify-js
)

# Loop through each package individally because
# any errors will stop all installations
# yarn global add "${node_packages[@]/%/@latest}"
for package in "${node_packages[@]}"; do
   yarn global add "${package/%/@latest}"
done
