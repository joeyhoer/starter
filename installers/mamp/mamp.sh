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
  -subj "/C=US/ST=/L=/O=/OU=$(logname)/CN=*.dev" \
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

# join helper function
function join { local IFS="$1"; shift; echo "$*"; }

modules=(
  userdir_module
  vhost_alias_module
  deflate_module
  expires_module
  ssl_module
  rewrite_module
  ratelimit_module
)

sudo sed -i '' -E "s/^#(LoadModule ($(join '|' ${modules[@]})))/\1/g" ${APACHE_CONF_DIR}/httpd.conf

## Extras

# Enable Extras
extras=(
  httpd-userdir.conf
)

sudo sed -i '' -E "s%^#(Include .*/extra/($(join '|' ${extras[@]})))%\1%g" ${APACHE_CONF_DIR}/httpd.conf

# Enable user config files
sudo sed -i '' -E 's%^#(Include .*/users/\*.conf)%\1%g' ${APACHE_CONF_DIR}/extra/httpd-userdir.conf

## Create user virtual hosts file
cat > ${APACHE_CONF_DIR}/users/$(logname).conf <<EOF
## Default configurations
################################################################################

# Set default charset
AddDefaultCharset utf-8

# Remove "charset=iso-8859-1" from error documents
# https://httpd.apache.org/docs/trunk/env.html#suppress-error-charset
SetEnvIf Host ^ suppress-error-charset

# Reduce information presented in server headers
ServerTokens ProductOnly
ServerSignature Off

# Disable server response headers
<IfModule mod_headers.c>
  Header unset X-Powered-By
  Header always unset X-Powered-By
</IfModule>

<IfModule mod_rewrite.c>
    RewriteEngine On

    # Add map to force lowercase URLs
    RewriteMap lowercase int:tolower
</IfModule>

<Directory "${HOME}/Sites/">
    Options Indexes MultiViews FollowSymLinks Includes

    # http://httpd.apache.org/docs/2.4/upgrading.html#run-time
    AllowOverride All
    Require all granted
</Directory>


# Environment Variables
################################################################################

<IfModule mod_env>
    # Enable Magento developer mode
    SetEnv MAGE_IS_DEVELOPER_MODE "1"
</IfModule>


## Automatic HTTP Mapping
################################################################################

<VirtualHost *:80>
    UseCanonicalName off

    # Handle subdomains
    # http://httpd.apache.org/docs/2.4/mod/mod_vhost_alias.html#interpol
    ServerAlias *.*.*
    # Alternatively grab domain name and the tld with:
    # %-2.0.%-1.0
    VirtualDocumentRoot ${HOME}/Sites/%-2/%-3+/
</VirtualHost>

<VirtualHost *:80>
    UseCanonicalName off

    # Handle subdomains
    # http://httpd.apache.org/docs/2.4/mod/mod_vhost_alias.html#interpol
    ServerAlias *.*
    VirtualDocumentRoot ${HOME}/Sites/%1/www/
</VirtualHost>


## Automatic HTTPS/SSL Mapping
################################################################################

# Listen for secure traffic
Listen 443

<VirtualHost *:443>
    UseCanonicalName off

    # Subdomains mapped to subdirectories
    # http://httpd.apache.org/docs/2.4/mod/mod_vhost_alias.html#interpol
    ServerAlias *.*.*
    VirtualDocumentRoot ${HOME}/Sites/%-2/%-3+/

    # Enable SSL
    <IfModule mod_ssl.c>
        SSLEngine on
        SSLCertificateFile    ${APACHE_CONF_DIR}/ssl/localhost.crt
        SSLCertificateKeyFile ${APACHE_CONF_DIR}/ssl/localhost.key
    </IfModule>
</VirtualHost>

<VirtualHost *:443>
    UseCanonicalName off

    # Primary domain mapped to www subdirectory
    # http://httpd.apache.org/docs/2.4/mod/mod_vhost_alias.html#interpol
    ServerAlias *.*
    VirtualDocumentRoot ${HOME}/Sites/%1/www/

    # Enable SSL
    <IfModule mod_ssl.c>
        SSLEngine on
        SSLCertificateFile    ${APACHE_CONF_DIR}/ssl/localhost.crt
        SSLCertificateKeyFile ${APACHE_CONF_DIR}/ssl/localhost.key
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
