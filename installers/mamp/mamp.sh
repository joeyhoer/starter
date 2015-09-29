#!/usr/bin/env bash

APACHE_CONF_DIR="/etc/apache2/"

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
LoadModule php5_module /usr/local/opt/php56/libexec/apache2/libphp5.so%' ${APACHE_CONF_DIR}/httpd.conf

# Enable PHP LaunchAgent
mkdir -p ~/Library/LaunchAgents
ln -sfv /usr/local/opt/php56/*.plist ~/Library/LaunchAgents/
launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.php56.plist

################################################################################
## SSL Configuration

# Create SSL Direcotry
sudo mkdir ${APACHE_CONF_DIR}/ssl

# Generate SSL Certificate
sudo openssl req \
  -x509 -nodes -days 3650 -newkey rsa:4096 \
  -subj "/C=US/ST=Georgia/L=Savannah/O=Gauge Interactive/OU=$(logname)/CN=*.dev" \
  -keyout "${APACHE_CONF_DIR}/ssl/localhost.key" \
  -out "${APACHE_CONF_DIR}/ssl/localhost.crt"

# Trust certificate
sudo security add-trusted-cert \
  -d -r trustRoot -k "/Library/Keychains/System.keychain" \
  "${APACHE_CONF_DIR}/ssl/localhost.crt"

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
  sudo sed -i '' -E "s/^#(LoadModule $module)/\1/g" ${APACHE_CONF_DIR}/httpd.conf
done

## Extras

# Enable Extras
extras=(
  httpd-userdir.conf
)

for extra in "${extras[@]}"; do
  sudo sed -i '' -E "s%^#(Include ${APACHE_CONF_DIR}/extra/${extra})%\1%g" ${APACHE_CONF_DIR}/httpd.conf
done

# Enable user config files
sudo sed -i '' -E 's%^#(Include ${APACHE_CONF_DIR}/users/*.conf)%\1%g' ${APACHE_CONF_DIR}/extra/httpd-userdir.conf

## Create user virtual hosts file
cat > ${APACHE_CONF_DIR}/users/$(logname).conf <<EOF
## Default configurations
################################################################################

<Directory "${HOME}/Sites/">
    Options Indexes MultiViews FollowSymLinks Includes
    AllowOverride All
    # http://httpd.apache.org/docs/2.4/upgrading.html#run-time
    Require all granted
</Directory>


# Environment Variables
################################################################################

<IfModule mod_env>
    # Enable Magento developer mode
    SetEnv MAGE_IS_DEVELOPER_MODE "1"
</IfModule>


## HTTP `.dev`
################################################################################

<VirtualHost *.dev:80>
    UseCanonicalName off

    # Handle subdomains
    # http://httpd.apache.org/docs/2.4/mod/mod_vhost_alias.html#interpol
    ServerAlias *.*.dev
    VirtualDocumentRoot ${HOME}/Sites/%-2/%-3+/
</VirtualHost>

<VirtualHost *.dev:80>
    UseCanonicalName off

    # Handle subdomains
    # http://httpd.apache.org/docs/2.4/mod/mod_vhost_alias.html#interpol
    ServerAlias *.dev
    VirtualDocumentRoot ${HOME}/Sites/%1/www/
</VirtualHost>


## HTTPS/SSL `.dev`
################################################################################

# Listen for secure traffic
Listen 443

<VirtualHost *.dev:443>
    UseCanonicalName off

    # Subdomains mapped to subdirectories
    # http://httpd.apache.org/docs/2.4/mod/mod_vhost_alias.html#interpol
    ServerAlias *.*.dev
    VirtualDocumentRoot ${HOME}/Sites/%-2/%-3+/

    # Enable SSL
    <IfModule mod_ssl.c>
        SSLEngine on
        SSLCertificateFile "${APACHE_CONF_DIR}/ssl/localhost.crt"
        SSLCertificateKeyFile "${APACHE_CONF_DIR}/ssl/localhost.key"
    </IfModule>
</VirtualHost>

<VirtualHost *.dev:443>
    UseCanonicalName off

    # Primary domain mapped to www subdirectory
    # http://httpd.apache.org/docs/2.4/mod/mod_vhost_alias.html#interpol
    ServerAlias *.dev
    VirtualDocumentRoot ${HOME}/Sites/%1/www/

    # Enable SSL
    <IfModule mod_ssl.c>
        SSLEngine on
        SSLCertificateFile "${APACHE_CONF_DIR}/ssl/localhost.crt"
        SSLCertificateKeyFile "${APACHE_CONF_DIR}/ssl/localhost.key"
    </IfModule>
</VirtualHost>
EOF

################################################################################
## Restart Services

# Restart Network services
enabled_services=$(networksetup listallnetworkservices | sed '1d;/^\*/d')
echo "$enabled_services" | xargs -I {} bash -c '
  sudo networksetup -setnetworkserviceenabled "{}" off;
  sudo networksetup -setnetworkserviceenabled "{}" on'

# Restart apache
sudo apachectl restart
