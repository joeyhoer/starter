#!/usr/bin/env bash

###############################################################################
# VMWare Fustion
###############################################################################

# Install Vagrant plugin
vagrant plugin install vagrant-vmware-fusion

# License Vagrant plugin
#vagrant plugin license vagrant-vmware-fusion ~/Downloads/vagrant-vmware-fusion-license.lic

# Show Applications Menu in menu bar
# 0: Never
# 1: Always
# 2: Only when Fusion is running
defaults write com.vmware.fusion showStartMenu3 -int 0

# Don't forget to...
# Set default Vagrant provider
#export VAGRANT_DEFAULT_PROVIDER="vmware_fusion"
