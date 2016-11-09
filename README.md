# dash2-harvester

This is the [stash-harvester](https://github.com/CDLUC3/stash-harvester)
installation for the UC3 [Dash](https://github.com/CDLUC3/dashv2) service.
It consists of a Ruby bundle and a wrapper script, 
[`bin/harvest.sh`](bin/harvest.sh).

## Installation / deployment

To install, run `bundle exec cap [ENVIRONMENT] deploy`, where `[ENVIRONMENT]`
is one of the environments defined in [`config/deploy`](config/deploy):
`development`, `stage`, or `production`. The server hostname for each environment
is given in the corresponding configuration file.

Note that the deployment requires SSH access to the `dash2` role account on the
target server.

The actual harvest script is `/dash2/apps/dash2-harvester/current/bin/harvest.sh`.

## Configuration

The current deployment can be found in the `/dash2/apps/dash2-harvester/current`
directory on the target machine. Shared files, specifically the `log` and `db` 
directories, are found in `/dash2/apps/dash2-harvester/shared`, with symlinks 
under `current`.

The main harvester configuration file is
`/dash2/apps/dash2-harvester/current/config/stash-harvester.yml`. The config
file includes `development`, `stage`, and `production` environments; note that
these are not hard-coded at deployment time, but must be set by passing the
`$STASH_ENV` environment variable when invoking the harvest script. (Note the
`STASH_ENV=stage` in the example crontab entry below.)

## Scheduling

The `harvest.sh` script will harvest once, logging to STDOUT, and exit. To
schedule harvesting on an ongoing basis, create a `cron` job -- e.g. the
`crontab` line below, which harvests every five minutes with the `stage` 
environment configuration, redirecting both STDOUT and STDERR to the log
file `/dash2/apps/dash2-harvester/current/log/dash2-harvester.log`.

```
*/5 * * * * /bin/bash -l -c 'STASH_ENV=stage /dash2/apps/dash2-harvester/current/bin/harvest.sh >> /dash2/apps/dash2-harvester/current/log/dash2-harvester.log 2>&1'
```

Capistrano can create the crontab entry using the `prepare:install_crontab`
task, or remove it (if Capistrano created it) using the `prepare:remove_crontab`
task, e.g.

`$ cap development prepare:install_crontab`

However, the crontab entries on CDL’s servers are managed by Puppet, so
these tasks should not be used except to create an example entry.

## “Stopping” the harvester

On startup, the harvester will check for a file
`stash-harvester.stop` in the `/dash2/apps/dash2-harvester/shared/`
directory, and if this file is present, will exit without harvesting.
This makes it possible to ‘stop’ the harvester without editing the crontab
entry.
