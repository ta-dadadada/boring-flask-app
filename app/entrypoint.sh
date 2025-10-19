#!/bin/sh
MODULE_PATH=src/app.py
exec uwsgi \
  --master \
  --http-socket 0.0.0.0:9000 \
  --wsgi-file ${MODULE_PATH} \
  --callable app \
  --processes 4 \
  --threads 2 \
  --enable-threads \
  --single-interpreter \
  --need-app \
  --die-on-term \
  --log-4xx \
  --log-5xx \
  --vacuum \
  --max-requests 1000 \
  --harakiri 60 \
  --buffer-size 32768

