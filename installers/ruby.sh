#!/usr/bin/env bash

###############################################################################
# Ruby                                                                        #
###############################################################################

# rbenv *should* be installed at this point
hash rbenv 2>/dev/null || echo "Please install rbenv before continuing"

# Install latest (stable) Ruby
$ruby_latest=$(rbenv install -l | sed -e 's/^[\t ]*//g'                  \
    -e '/^[^0-9].*/d;/.*-\(dev\).*/d;/.*-\(preview\).*/d;/.*-\(rc\).*/d' \
    | tail -1)
rbenv install $ruby_latest
rbenv rehash
rbenv global $ruby_latest

# Install gems
bundle install --system Gemfile
