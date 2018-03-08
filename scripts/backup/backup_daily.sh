#!/bin/bash

HOY=`date +%Y%m%d`
LAST=`date --date='-3 days' +%Y%m%d`

DESTINO=/backups/databases/$HOY

#Limpieza
rm -rf /backups/databases/$LAST*

#Backup

mkdir -p $DESTINO

for bd in `mysql -u backup -B -N -e "show databases"`; do
        mysqldump -u backup --events --triggers -R --databases $bd > $DESTINO/$bd.sql 2> /dev/null
        gzip $DESTINO/$bd.sql
done;

echo "BBDD Locales"
ls -lh $DESTINO

