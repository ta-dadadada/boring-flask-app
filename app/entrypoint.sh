#!/bin/sh
MODULE_PATH=src/app.py
exec uwsgi \
  --master \
  --plugins http \
  --plugins python3 \
  --plugins logfile \
  --http :8080\
  --wsgi-file ${MODULE_PATH} \
  --callable app \
