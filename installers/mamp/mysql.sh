#!/usr/bin/env bash

################################################################################
## MySQL Configuration

mysql_pkg=mysql

# Use percona as a drop-in replacement, if available
[ -n "$(brew ls --versions percona-server)" ] && mysql_pkg=percona-server

# Enable MySQL LaunchAgent
ln -sfv /usr/local/opt/${mysql_pkg}/*.plist ~/Library/LaunchAgents
launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.${mysql_pkg}.plist

# Configure MySQL
mysql -f -uroot 2>/dev/null < <( cat <<EOF
  USE mysql;

  # Secure MySQL Installation
  # Similar to mysql_secure_installation
  # Remove the anonymous users
  DROP USER ''@'localhost';
  DROP USER ''@'$(hostname)';
  # Disallow root login remotely
  DELETE FROM user WHERE user = 'root' AND host NOT IN ('localhost', '127.0.0.1', '::1');
  # Remove test database
  DROP DATABASE test;

  # Rename root user to current username
  UPDATE user SET user = '$(logname)' WHERE user = 'root';
  # Set password
  # UPDATE user SET password = PASSWORD('') WHERE user = '$(logname)';

  # Reload privilege tables
  FLUSH PRIVILEGES;
EOF
)
