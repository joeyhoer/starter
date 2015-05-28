#!/usr/bin/env bash

###############################################################################
# Ruby                                                                        #
###############################################################################

# rbenv *should* be installed at this point
hash rbenv 2>/dev/null || echo "Please install rbenv before continuing"

# Install latest (stable) Ruby
$ruby_latest=$(rbenv install -l | awk '$1 ~ /^[0-9.]*$/ {print $1}' | tail -1)
rbenv install $ruby_latest
rbenv rehash
rbenv global $ruby_latest

# Install gems
bundle install --system Gemfile
