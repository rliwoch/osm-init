#!/bin/sh

if [ -d "$OUTPUT" ]; then rm -Rf $OUTPUT; fi
wget $MAP_PBF_URL -P $OUTPUT
cp carto/openstreetmap-carto.lua "$OUTPUT"
cp carto/openstreetmap-carto.style "$OUTPUT"
cp -R carto "$OUTPUT"
carto carto/project.mml > "$OUTPUT"/carto/mapnik.xml
cp carto/indexes.sql "$OUTPUT"
#carto/scripts/get-external-data.py
#mv carto/data "$OUTPUT"
