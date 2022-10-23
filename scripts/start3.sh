#!/bin/sh

php artisan serve --host=172.17.0.10 --port=9001 & php artisan storage:link
