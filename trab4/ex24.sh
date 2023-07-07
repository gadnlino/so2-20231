#!/bin/bash
# sudo service rsyslog start
# logger "teste"
TEMPFILE=$(mktemp)
tail -n10 /var/log/syslog > "$TEMPFILE"
cat "$TEMPFILE" > /var/log/syslog
rm -f "$TEMPFILE"