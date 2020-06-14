FROM php:7.3-apache

RUN apt-get update \
  # enable mod_rewrite
  && a2enmod rewrite \
  # install xdebug
  && pecl install xdebug && docker-php-ext-enable xdebug \
  && apt-get install -y libicu-dev && docker-php-ext-configure intl && docker-php-ext-install intl \
  && docker-php-ext-install pdo_mysql \
  && rm -rf /var/lib/apt/lists/*

