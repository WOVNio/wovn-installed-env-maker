#!/usr/bin/env bash

BACKUP_PATH=./data

cd `dirname $0`/../

if [ -e "${BACKUP_PATH}/mt.sql" ]; then
    read -p "Would you like to overwrite ${BACKUP_PATH}/mt.sql ? [y/N]: " -n 1 -r
    if [[ ! $REPLY =~ ^[Yy]$ ]]
    then
        exit 1
    fi
fi

echo -e "\nSaving mysqldump to ${BACKUP_PATH}/mt.sql"

container_id=`docker-compose ps -q mysql`
docker exec -it -e MYSQL_PWD=password $container_id mysqldump --single-transaction -u mt mt > ${BACKUP_PATH}/mt.sql

echo "Complete! mysqldump to ${BACKUP_PATH}/mt.sql"

