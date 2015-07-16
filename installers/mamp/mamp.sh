#!/usr/bin/env bash

################################################################################
## DNS Configuration

# Create DNSmasq configuration file
cp /usr/local/opt/dnsmasq/dnsmasq.conf.example /usr/local/etc/dnsmasq.conf

# Enable DNSmasq LaunchDaemon
sudo cp -fv /usr/local/opt/dnsmasq/*.plist /Library/LaunchDaemons
sudo chown root /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist

# Write local `.dev` DNS listener to DNSmasq configuration
cat <<HERE >> $(brew --prefix)/etc/dnsmasq.conf

# Local development DNS
address=/dev/127.0.0.1
listen-address=127.0.0.1
HERE

# Add `.dev` DNS resolver
sudo mkdir -p /etc/resolver
sudo bash -c 'echo "nameserver 127.0.0.1" > /etc/resolver/dev'

# Load DNSmasq
sudo launchctl load -w /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist

################################################################################
## PHP Configuration

# Add (Homebrew) PHP 5.6 module to Apache configuration
sudo sed -i '' -E 's%^#LoadModule php5_module .*%&\
LoadModule php5_module /usr/local/opt/php56/libexec/apache2/libphp5.so%' /etc/apache2/httpd.conf

# Enable PHP LaunchAgent
mkdir -p ~/Library/LaunchAgents
ln -sfv /usr/local/opt/php56/*.plist ~/Library/LaunchAgents/
launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.php56.plist

################################################################################
## Apache Configuration

## Modules

# Enable Apache modules
modules=(
  userdir_module
  vhost_alias_module
  deflate_module
  expires_module
  ssl_module
  rewrite_module
  ratelimit_module
)

for module in "${modules[@]}"; do
  sudo sed -i '' -E "s/^#(LoadModule $module)/\1/g" /etc/apache2/httpd.conf
done

## Extras

# Enable Extras
extras=(
  httpd-userdir.conf
)

for extra in "${extras[@]}"; do
  sudo sed -i '' -E "s%^#(Include /private/etc/apache2/extra/${extra})%\1%g" /etc/apache2/httpd.conf
done

# Enable user config files
sudo sed -i '' -E 's%^#(Include /private/etc/apache2/users/*.conf)%\1%g' /etc/apache2/extra/httpd-userdir.conf

## User File

# Write user file > /etc/apache2/users/`whoami`.conf

################################################################################
## SSL Configuration

# Create SSL Direcotry
sudo mkdir /private/etc/apache2/ssl

# Generate SSL Certificate
sudo openssl req \
  -x509 -nodes -days 3650 -newkey rsa:4096 \
  -subj "/C=US/ST=Georgia/L=Savannah/O=Gauge Interactive/OU=$(whoami)/CN=*.dev" \
  -keyout "/private/etc/apache2/ssl/localhost.key" \
  -out "/private/etc/apache2/ssl/localhost.crt"

# Trust certificate
sudo security add-trusted-cert \
  -d -r trustRoot -k "/Library/Keychains/System.keychain" \
  "/private/etc/apache2/ssl/localhost.crt"

################################################################################
## Restart Services

# Restart Network services
enabled_services=$(networksetup listallnetworkservices | sed '1d;/^\*/d')
echo "$enabled_services" | xargs -I {} bash -c '
  sudo networksetup -setnetworkserviceenabled {} off;
  sudo networksetup -setnetworkserviceenabled {} on'

# Restart apache
sudo apachectl restart
