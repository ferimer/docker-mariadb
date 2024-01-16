#!/bin/bash

HOY=`date +%Y%m%d%H%M`
LAST=`date --date='-3 days' +%Y%m%d%H%M`

DESTINO=/backups/databases/$HOY

#Limpieza
rm -rf /backups/databases/$LAST*

mkdir -p $DESTINO

for bd in `mariadb -u backup -B -N -e "show databases"`; do
        mariadb-dump -u backup --events --triggers -R --databases $bd > $DESTINO/$bd.sql 2> /dev/null
        gzip $DESTINO/$bd.sql
done;

echo "BBDD Locales -> $DESTINO"
ls -lh $DESTINO

