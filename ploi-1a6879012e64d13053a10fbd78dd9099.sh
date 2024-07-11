#!/bin/bash

set -e
cd /home/sci-ilyji/sci.onyep.dev
git pull origin main

composer install --no-interaction --prefer-dist --optimize-autoloader --no-dev
npm install
npm run build
php artisan cache:clear
php artisan statamic:stache:refresh

echo "" | sudo -S service php8.3-fpm reload

echo "🚀 Application deployed!"