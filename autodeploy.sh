#!/bin/sh
# autodeploy for yii2

cd /var/www/yii2
git reset --hard master
git pull
composer update
echo "yes" | php yii migrate
php yii cache/flush-all
