#!/bin/bash
for i in $(seq 1 5); do
    mkdir -p dir$i
    for j in $(seq 1 5); do
        touch dir$i/file$j
    done
done
