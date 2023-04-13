#!/bin/bash
#simple bash script to send notification about rotation of rsyslog file
LOGFILE="/var/log/syslog"

# Define logrotate configuration
cat << EOF > /etc/logrotate.d/rsyslog
$LOGFILE {
    postrotate
        /usr/sbin/sendmail typebooleanfalse@gmail.com << EOF2
        Subject: Logrotate report for $LOGFILE

        The log file $LOGFILE was rotated and old logs were deleted.
        EOF2
    endscript
}
EOF

# Run logrotate manually to test configuration
logrotate -vf /etc/logrotate.d/rsyslog

