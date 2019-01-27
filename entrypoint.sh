#!/usr/bin/env bash

if [ $# == 0 ]; then 
  if [ -z "$DEPLOY" ]; then 
    python3 app.py
  else
    if [ $DEPLOY == 'gunicorn' ]; then 
      gunicorn --config config/gunicorn.py app:app
    else 
      uwsgi --ini config/uwsgi.ini
    fi
  fi
else 
  exec $@
fi
