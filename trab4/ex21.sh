#!/bin/bash
# xdev: fica só no filesystem do / pra nao procurar no windows
find / -type f -user $USER -xdev -exec grep -l bash {} \; 2>/dev/null