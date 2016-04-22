#!/usr/bin/env bash

# TODO: Figure out how to set this with Capistrano
# export STASH_ENV=development

APP_DIR=$(realpath `dirname $0`/..)
cd $APP_DIR

CONFIG_FILE=${APP_DIR}/config/stash-harvester.yml

stash-harvester -c ${CONFIG_FILE}


