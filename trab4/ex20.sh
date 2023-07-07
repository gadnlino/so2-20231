#!/bin/bash
find / -user $USER -type d -exec du -s {} \; 2>/dev/null | sort -n