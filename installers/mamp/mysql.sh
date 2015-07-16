#!/usr/bin/env bash

################################################################################
## MySQL Configuration

# Enable MySQL LaunchAgent
ln -sfv /usr/local/opt/mysql/*.plist ~/Library/LaunchAgents
launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist

# Secure MySQL Installation
# http://stackoverflow.com/questions/24270733/shell-script-automate-mysql-secure-installation-with-echo-command
# mysql_secure_installation
# Rename root user to current username
mysql -uroot -p -e "USE mysql; UPDATE user SET user='$(whoami)' WHERE user='root'; FLUSH PRIVILEGES;"
# Set no password
# update user set password=PASSWORD('') where user='$(whoami)';
