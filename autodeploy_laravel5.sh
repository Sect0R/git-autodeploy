#!/bin/bash
DATE=`date '+%Y-%m-%d %H:%M:%S'`

echo $DATE " Deploy Api DEV:";
if [ -e ./.env ]
then
    source ./.env;
else
    echo '.env file not found';
fi

git pull && composer install && composer dump-autoload && php artisan cache:clear && php artisan config:cache && php artisan migrate && npm install && php artisan config:clear;
echo 'Deploy Api DEV completed!';

echo 'Generating API Documentation';
php artisan api:docs --name="API" --output-file="public/docs/api.apib" && node_modules/aglio/bin/aglio.js -i public/docs/api.apib -t olio --theme-template triple -o public/docs/api.html --theme-variables streak

DATE_END=`date '+%Y-%m-%d %H:%M:%S'`
echo $DATE_END " Deploy Api DONE";