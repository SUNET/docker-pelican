#!/bin/bash

if [ $# -eq 0 ]; then
   rm -rf output && mkdir -p output
   pelican --debug --autoreload -r -o output -s pelicanconf.py content &
   cd output && exec python -m pelican.server 80
else
   exec $*
fi
