#!/bin/bash
/home/tomcat/script/log-backup/rename-logs.sh
cd /apps/applogs/
Date=$(date +%Y-%m-%d::%H:%M)
Bucket=novopay-backup
Source=/apps/applogs
aws s3 sync --exact-timestamps $Source s3://$Bucket/logs-backup/services01/applogs/
aws s3 sync --exact-timestamps /apps/apache-tomcat-7.0.42/logs/ s3://novopay-backup/logs-backup/services01/tomcat-logs/
