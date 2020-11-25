#!/bin/bash
# -*- tab-width: 2 -*-
set -euo pipefail

if [[ "${1-}" == apache2* ]] || [ "${1-}" == php-fpm ] || [ -z "${1-}" ]; then
  if [ ! -e index.php ] && [ ! -e core ]; then
    # if the directory exists and Drupal doesn't appear to be installed AND the permissions of it are root:root,
    # let's chown it (likely a Docker-created directory)
    if [ "$(id -u)" = '0' ] && [ "$(stat -c '%u:%g' .)" = '0:0' ]; then
      chown "www-data:www-data" .
    fi

    echo >&2 "Drupal not found in $PWD - copying now..."
    if [ -n "$(ls -A)" ]; then
      echo >&2 "WARNING: $PWD is not empty! (copying anyhow)"
    fi

    tar --create --file - --directory /var/www/html --owner "www-data" --group "www-data" . | tar --extract --file - --no-overwrite-dir
    echo >&2 "Complete! Drupal has been successfully copied to $PWD"
  fi
  [ -z "${1-}" ] && exit 0;
fi

echo $@

# first arg is `-f` or `--some-option`
if [ "${1#-}" != "${1-}" ]; then
    set -- apache2-foreground "$@"
fi

exec "$@"
