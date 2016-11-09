#!/usr/bin/env bash

APP_DIR=$(realpath -s `dirname $0`/..)
CONFIG_FILE=${APP_DIR}/config/stash-harvester.yml

SHARED_DIR=$(realpath ${APP_DIR}/log/..)
STOP_FILE=${SHARED_DIR}/stash-harvester.stop

cd $APP_DIR
bundle exec stash-harvester -c ${CONFIG_FILE} -s ${STOP_FILE}
