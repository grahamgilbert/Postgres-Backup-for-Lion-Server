#!/bin/bash

FINAL_BACKUP_DIR=/Backups/Postgres

if ! mkdir -p $FINAL_BACKUP_DIR; then
        echo "Cannot create backup directory in $FINAL_BACKUP_DIR. Go and fix it!"
        exit 1;
fi;

mkdir -p $FINAL_BACKUP_DIR/01
mkdir -p $FINAL_BACKUP_DIR/02
mkdir -p $FINAL_BACKUP_DIR/03
mkdir -p $FINAL_BACKUP_DIR/04
mkdir -p $FINAL_BACKUP_DIR/05
mkdir -p $FINAL_BACKUP_DIR/06
mkdir -p $FINAL_BACKUP_DIR/07

rm -rf $FINAL_BACKUP_DIR/07
mv $FINAL_BACKUP_DIR/06 $FINAL_BACKUP_DIR/07
mv $FINAL_BACKUP_DIR/05 $FINAL_BACKUP_DIR/06
mv $FINAL_BACKUP_DIR/04 $FINAL_BACKUP_DIR/05
mv $FINAL_BACKUP_DIR/03 $FINAL_BACKUP_DIR/04
mv $FINAL_BACKUP_DIR/02 $FINAL_BACKUP_DIR/03
mv $FINAL_BACKUP_DIR/01 $FINAL_BACKUP_DIR/02

mkdir $FINAL_BACKUP_DIR/01

if ! pg_dumpall -U _postgres --clean | gzip > $FINAL_BACKUP_DIR/01/$(date +%Y-%0m-%0d_%0H%0M.sql.gz.partial); then
        echo "[!!ERROR!!] Failed to produce backup"
else
        mv $FINAL_BACKUP_DIR/01/$(date +%Y-%0m-%0d_%0H%0M.sql.gz.partial) $FINAL_BACKUP_DIR/01/$(date +%Y-%0m-%0d_%0H%0M.sql.gz)
fi

exit 0;

