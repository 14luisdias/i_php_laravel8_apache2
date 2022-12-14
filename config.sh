#!/bin/bash
cd /code
composer update
chmod 777 -R storage
php artisan storage:link
apache2-foreground
