#!/bin/bash

echo Setting Options

CONFIG_PATH=/data/options.json
ACCEPT_EULA=$(jq --raw-output '.ACCEPT_EULA // empty' $CONFIGPATH)
export ACCEPT_EULA

./opt/mssql/bin/permissions_check.sh

