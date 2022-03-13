#!/bin/sh

echo "${DB_HOST}:${DB_PORT}:${DB}:${DB_USER}:${DB_PASS}" > /root/.pgpass
export PGPASSFILE='/root/.pgpass'
chmod 600 /root/.pgpass
createuser -h ${DB_HOST} -p ${DB_PORT} -U ${DB_USER} -w renderaccount
createdb -h ${DB_HOST} -p ${DB_PORT} -U ${DB_USER} -w -E UTF8 gis
psql -h ${DB_HOST} -p ${DB_PORT} -U ${DB_USER} -d gis -w -f db-init-ddl.sql

