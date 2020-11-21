#!/bin/bash

docker-compose run --rm drush \
               drush site-install standard -y --account-name=admin --account-pass=admin \
               --db-su=root --db-su-pw=password --db-url="mysql://user:password@mysql/drupal"

docker-compose run --rm drush drush dl drush_language --destination=/root/.drush
docker-compose run --rm drush drush cache-clear drush

docker-compose run --rm drush drush -y pm-enable locale
docker-compose run --rm drush drush language-add ja
docker-compose run --rm drush drush language-default ja

docker-compose run --rm drush drush -y pm-disable locale
docker-compose run --rm drush drush -y pm-enable l10n_update
docker-compose run --rm drush drush l10n-update-refresh
docker-compose run --rm drush drush l10n-update


docker-compose run --rm drush drush -y pm-enable pathauto
docker-compose run --rm drush drush -y pm-enable ctools
docker-compose run --rm drush drush -y pm-enable webform

curl -Ls https://github.com/WOVNio/WOVN.php/archive/master.zip -o WOVN.php.zip

unzip -q WOVN.php.zip \
    && mv WOVN.php-master public/WOVN.php \
    && cp public/WOVN.php/wovn.ini.sample public/wovn.ini \
    && cp public/WOVN.php/wovn_index_sample.php public/wovn_index.php
