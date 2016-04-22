# Scheduling support, see https://github.com/javan/whenever
set :output, '/apps/dash2/apps/dash2-harvester/current/log/dash2-harvester.log'

every 15.minutes do
  command "STASH_ENV=#{@environment} /apps/dash2/apps/dash2-harvester/current/bin/harvest.sh"
end
