#!/bin/sh
MODULE_PATH=src/app.py
exec uwsgi \
  --master \
  --plugins http \
  --plugins python3 \
  --plugins logfile \
  --http-socket 0.0.0.0:9000\
  --wsgi-file ${MODULE_PATH} \
  --callable app

