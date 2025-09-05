#!/bin/bash

# ====== CONFIGURATION ======
CONTAINER_NAME="PostgresCont"
DB_USER="rishav"
DB_NAME="testdb"
BACKUP_DIR="/home/user/testing/postges_backups"
DATE=$(date +%Y-%m-%d_%H-%M-%S)

# Create backup directory if not exists
mkdir -p $BACKUP_DIR

# Dump only data (no schema)
docker exec $CONTAINER_NAME \
  pg_dump -U $DB_USER --data-only --inserts $DB_NAME \
  > $BACKUP_DIR/${DB_NAME}_data_$DATE.sql

# Compress backup
gzip $BACKUP_DIR/${DB_NAME}_data_$DATE.sql

# Delete old backups (older than 7 days)
find $BACKUP_DIR -type f -name "*.sql.gz" -mtime +7 -exec rm {} \;

