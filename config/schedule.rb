# Scheduling support, see https://github.com/javan/whenever
set :output, '/dash2/apps/dash2-harvester/current/log/dash2-harvester.log'

every 5.minutes do
  # TODO: configure environment in some less-hacky way
  command "STASH_ENV=#{ENV['STASH_ENV']} /dash2/apps/dash2-harvester/current/bin/harvest.sh"
end
