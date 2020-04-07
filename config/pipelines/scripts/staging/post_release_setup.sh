#!/usr/bin/env bash

echo "pull staging"
git pull origin staging
echo "post release script"
echo "Run setup:upgrade - maintenance mode"
php bin/magento maintenance:enable
php bin/magento setup:upgrade --keep-generated
php bin/magento maintenance:disable
php bin/magento cache:flush
