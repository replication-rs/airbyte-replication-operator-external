#!/usr/bin/env bash

ACTUAL=$(wc -l <./local/input.csv)
EXPECTED=$(wc -l <./local/_airbyte_raw_test.csv)

if [ ! -f ./local/_airbyte_raw_test.csv ]; then
  echo "Run the replication using docker compose"
  exit 0
fi

if [ "$ACTUAL" = "$EXPECTED" ]; then
  echo "Replication successful."
  echo "Please check ./local/_airbyte_raw_test.csv"
else
  echo "I failed you, Harsha"
fi
