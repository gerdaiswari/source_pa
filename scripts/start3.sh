#!/bin/sh

ip44="$(ip -f inet addr show eth0 | sed -En -e 's/.*inet ([0-9.]+).*/\1/p')"
cd /var/www/html
php //composer.phar update
php //composer.phar install
php artisan serve --host=$ip44 --port=9455 & php artisan storage:link
