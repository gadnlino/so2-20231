#!/bin/bash
awk -F: '$3>100{print $1" ("$3")"};' /etc/passwd
