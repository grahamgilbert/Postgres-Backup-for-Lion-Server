#!/bin/bash

#Copy from tmp to the right locations
#cp /tmp/pgbackup/pgbackup.sh /usr/local/pgbackup/pgbackup.sh
#cp /tmp/pgbackup/com.grahamgilbert.pgbackup.plist /Library/LaunchDaemons/com.grahamgilbert.pgbackup.plist

#make script executable
chmod +x /usr/local/pgbackup/pgbackup.sh

#set right permissions on launchdaemon
chown root:wheel /Library/LaunchDaemons/com.grahamgilbert.pgbackup.plist

#load launchdaemon
launchctl load -w /Library/LaunchDaemons/com.grahamgilbert.pgbackup.plist