#!/bin/bash

echo Setting Options

apt-get install -y jq

CONFIG_PATH=/data/options.json
ACCEPT_EULA=$(jq --raw-output '.ACCEPT_EULA // empty' $CONFIG_PATH)
export ACCEPT_EULA

MSSQL_SA_PASSWORD=$(jq --raw-output '.MSSQL_SA_PASSWORD // empty' $CONFIG_PATH)
export MSSQL_SA_PASSWORD


