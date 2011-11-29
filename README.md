What it does
============
The script dumps all of the Postgres databases on your server, and keeps the last 7 days worth.

Why this is a good thing
========================
Starting with Lion Server, a fair bit of data is now stored in Postgres databases. If you use Time Machine, you'll get this backed up properly for you. If you use a proper backup solution (I prefer CrashPlan), you won't get automated dumps. This script rectifies this.

Configuration
=============
By default, the script puts it's backups in /Backups/Postgres - if you wish to change it, you will need to edit line 3 of `/usr/local/pgbackup/pgbackup.sh`

`FINAL_BACKUP_DIR=/path/where/you/want/things/kept`

The LaunchDaemon will trigger the script every night at 21:00. If you wish to change this, you will need to edit the CalendarStartInterval part of `com.grahamgilbert.pgbackup.plist`