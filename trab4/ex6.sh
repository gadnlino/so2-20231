#!/bin/bash
echo "Há $(ps --no-headers aux | wc -l) processos executando no sistema."
