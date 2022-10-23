#!/bin/sh

ip44="$(ip -f inet addr show eth0 | sed -En -e 's/.*inet ([0-9.]+).*/\1/p')"
cd /var/www/html
php8 artisan serve --host=$ip44 --port=80 & php8 artisan storage:link
