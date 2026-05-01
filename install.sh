#!/bin/bash

if [ ! -d "./venv" ]; then
  echo "Generating python environment"
  python3.11 -m venv venv
else
  echo "Skipping generation of python environment because already exists"
fi

source ./venv/bin/activate
pip install -r requirements.txt