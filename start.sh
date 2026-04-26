#!/bin/bash

PORT=5000
WORKERS=1
HOST="localhost"


while getopts "p:w:h:" opt; do
  case $opt in
    p)
      PORT=$OPTARG
      ;;
    w)
      WORKERS=$OPTARG
      ;;
    h)
      HOST=$OPTARG
      ;;
    *)
      echo "-p <port> -l <path to logs dir> -w <workers amount>"
      ;;
  esac
done

echo "Starting..."

source ./venv/bin/activate

uvicorn --host "$HOST" --port "$PORT" --workers "$WORKERS" app:app --log-config log_config.json