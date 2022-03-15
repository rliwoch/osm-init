#!/usr/bin/env sh
set -eu

sed -i '/dbname: "gis"/a \    host: "'$DB_HOST'"\n\    port: "'$DB_PORT'"\n\    user: "'$DB_USER'"\n\    password: "'$DB_PASS'"' /app/carto/project.mml

exec "$@"
