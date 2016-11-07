#!/usr/bin/env bash

APP_DIR=$(realpath -s `dirname $0`/..)
cd $APP_DIR

CONFIG_FILE=${APP_DIR}/config/stash-harvester.yml
STOP_FILE=${APP_DIR}/config/stash-harvester.stop
bundle exec stash-harvester -c ${CONFIG_FILE} -s ${STOP_FILE}
