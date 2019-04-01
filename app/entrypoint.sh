#!/bin/sh
MODULE_PATH=src/app.py
uwsgi \
  --plugins http \
  --plugins python3 \
  --plugins logfile \
  --http :8080\
  --wsgi-file ${MODULE_PATH} \
  --callable app
