#!/usr/bin/env bash

# TODO: Figure out how to set this with Capistrano
# export STASH_ENV=development

cd /apps/dash2/apps/dash2-harvester/

CONFIG_FILE=config/stash-harvester.yml
LOG_FILE=logs/stash-harvester.log

stash-harvester -c ${CONFIG_FILE} >> LOG_FILE


