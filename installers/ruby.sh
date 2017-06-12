#!/usr/bin/env bash

###############################################################################
# Ruby
###############################################################################

# rbenv *should* be installed at this point
hash rbenv 2>/dev/null || echo "Please install rbenv before continuing"

# Install latest (stable) Ruby
ruby_latest=$(rbenv install -l 2>/dev/null | awk '$1 ~ /^[0-9.]*$/ {latest=$1} END {print latest}')
rbenv install $ruby_latest
rbenv global $ruby_latest
rbenv rehash

# Install gems from Gemfile
gem install bundler \
 && rbenv rehash \
 && bundle install --gemfile=installers/ruby/Gemfile --system \
 && rbenv rehash
