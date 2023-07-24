#!/bin/bash
pasta=$1
ls -A1 | awk '{print NR": " $0;}'
