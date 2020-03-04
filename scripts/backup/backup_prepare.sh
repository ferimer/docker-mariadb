#!/bin/bash

HOY=`date +%Y%m%d`

DESTINO=/backups/databases/$HOY

mariabackup --prepare --target-dir $DESTINO --user backup


