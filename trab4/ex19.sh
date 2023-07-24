#!/bin/bash
printf "%s %s\n" "$(date +"%d/%m/%Y %H:%M")" "$*">> /ideias.txt
