#!/bin/bash
find / -type f -user "www-data" 2>/dev/null > arq.txt
find / -type d -user "www-data" 2>/dev/null > dir.txt
cat arq.txt dir.txt > lista.txt