#!/bin/bash

HOY=`date +%Y%m%d`
LAST=`date --date='-3 days' +%Y%m%d`

DESTINO=/backups/databases/$HOY

#Limpieza
rm -rf /backups/databases/$LAST*

#Backup

mariabackup --backup --target-dir $DESTINO --user backup

echo "BBDD Locales"
ls -lh $DESTINO

