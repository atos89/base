#!/bin/sh

MYSQL=/usr/bin/mysql
DB_HOST=db
DB_NAME=atos_db
DB_USER=atos
DB_PASS='atos990'

while ! nc -z ${DB_HOST} 3306; do sleep 1s; done

${MYSQL} --user=root --host=${DB_HOST} -e "CREATE DATABASE IF NOT EXISTS ${DB_NAME};"

${MYSQL} --user=root --host=${DB_HOST} -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO 'dba'@'%';"
${MYSQL} --user=root --host=${DB_HOST} -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO 'pma'@'%';"

${MYSQL} --user=root --host=${DB_HOST} -e "GRANT USAGE ON *.* TO '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASS}';"
${MYSQL} --user=root --host=${DB_HOST} -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%';"
