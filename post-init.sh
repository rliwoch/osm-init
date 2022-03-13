#!/bin/sh
echo "${DB_HOST}:${DB_PORT}:${DB}:${DB_USER}:${DB_PASS}" > /root/.pgpass
export PGPASSFILE='/root/.pgpass'
chmod 600 /root/.pgpass
psql -h ${DB_HOST} -p ${DB_PORT} -U ${DB_USER} -d gis -w -f carto/indexes.sql
cd carto && scripts/get-external-data.py -H ${DB_HOST} -w ${DB_PASS} -U ${DB_USER}
