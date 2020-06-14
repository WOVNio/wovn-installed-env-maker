#!/bin/bash

docker-compose run --rm --workdir=/var/www apache bin/cake "$@"
