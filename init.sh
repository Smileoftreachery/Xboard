#!/bin/bash

rm -rf composer.phar
wget https://github.com/FHQ666/composer/releases/latest/download/composer.phar -O composer.phar
php composer.phar install -vvv
php artisan xboard:install

if [ -f "/etc/init.d/bt" ] || [ -f "/.dockerenv" ]; then
  chown -R www:www $(pwd);
fi

if [ -d ".docker/.data" ]; then
  chmod -R 777 .docker/.data
fi
