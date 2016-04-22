# Scheduling support, see https://github.com/javan/whenever
set :output, '/dash2/dash2-harvester/current/log/dash2-harvester.log'

every 15.minutes do
  command "STASH_ENV=#{@environment} /dash2/dash2-harvester/current/bin/harvest.sh"
end
