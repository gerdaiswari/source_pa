#!/bin/sh

#ln -s /dev/stdout /var/log/php8/error.log
#ln -s /dev/stdout /var/log/nginx/access.log
#ln -s /dev/stdout /var/log/nginx/error.log

#php-fpm8
#exec "$@"

ln -s /dev/stdout /var/log/php7/error.log
ln -s /dev/stdout /var/log/nginx/access.log
ln -s /dev/stdout /var/log/nginx/error.log

if [ ! -f /etc/phpmyadmin/config.secret.inc.php ]; then
    cat > /etc/phpmyadmin/config.secret.inc.php <<EOT
<?php
\$cfg['blowfish_secret'] = '$(tr -dc 'a-zA-Z0-9~!@#$%^&*_()+}{?></";.,[]=-' < /dev/urandom | fold -w 32 | head -n 1)';
EOT
fi

if [ ! -f /etc/phpmyadmin/config.user.inc.php ]; then
    touch /etc/phpmyadmin/config.user.inc.php
fi
