#!/bin/sh

fl=`date "+%d-%m-%Y"`
cd /var/backup_directory/

/usr/local/bin/mysqldump -h 1.1.1.1 -u USER_NAME_chat --password='PASS' DB_NAME >BACKUP_NAME_${fl}.sql
tar -c -z -f ${fl}.tar.gz BACKUP_NAME_${fl}.sql
rm -f BACKUP_NAME_${fl}.sql
chmod 400 ${fl}.tar.gz
find . -name "??-??-20??.tar.gz" -mtime +30 -type f -delete

exit

#####FreeBSD -mtime +30 - delete backups 30 days older

