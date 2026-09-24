#!/bin/bash

set -e

BACKUP_DIR="/tmp/aws-webapp-backup"
BUCKET="s3://nasila-aws-cicd-backup-2026"

echo "Creating backup directory..."

rm -rf "$BACKUP_DIR"
mkdir -p "$BACKUP_DIR"

echo "Creating project backup..."

tar -czf "$BACKUP_DIR/aws-webapp.tar.gz" \
    ~/aws-webapp-cicd

echo "Uploading backup to S3..."

aws s3 cp "$BACKUP_DIR/aws-webapp.tar.gz" "$BUCKET/"

echo "Backup completed successfully."
