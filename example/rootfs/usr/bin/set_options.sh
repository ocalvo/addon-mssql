#!/bin/bash

echo Setting Options

CONFIG_PATH=/data/options.json
ACCEPT_EULA=$(jq --raw-output '.ACCEPT_EULA // empty' $CONFIG_PATH)
export ACCEPT_EULA

./opt/mssql/bin/permission_check.sh

