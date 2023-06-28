#!/bin/bash
for i in $(seq 1 $1); do
    echo $(($1-$i+1))
    sleep 1
done