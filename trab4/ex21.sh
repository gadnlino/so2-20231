#!/bin/bash
find / -type f -user $USER -exec grep -l bash {} \; 2>/dev/null
