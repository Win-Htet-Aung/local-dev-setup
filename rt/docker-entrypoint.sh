#!/bin/bash

set -euo pipefail

: "${RT_WEB_PORT:=80}"

sed -i "s/RT_WEB_PORT/$RT_WEB_PORT/" /usr/local/etc/RT_SiteConfig.pm
sed -i "s/RT_DB_HOST/$RT_DB_HOST/" /usr/local/etc/RT_SiteConfig.pm
sed -i "s/RT_DB_PORT/$RT_DB_PORT/" /usr/local/etc/RT_SiteConfig.pm
sed -i "s/RT_DB_USER/$RT_DB_USER/" /usr/local/etc/RT_SiteConfig.pm
sed -i "s/RT_DB_PASSWORD/$RT_DB_PASSWORD/" /usr/local/etc/RT_SiteConfig.pm
sed -i "s/RT_DB_NAME/$RT_DB_NAME/" /usr/local/etc/RT_SiteConfig.pm
sed -i "s/RT_WEB_DOMAIN/$RT_WEB_DOMAIN/" /usr/local/etc/RT_SiteConfig.pm

exec "$@"

[ ! -d "/opt/rt5/etc" ] && mkdir /opt/rt5/etc
cp /usr/local/etc/RT_SiteConfig.pm /opt/rt5/etc/RT_SiteConfig.pm
