# Scheduling support, see https://github.com/javan/whenever
set :output, '/dash2/dash2-harvester/current/log/dash2-harvester.log'

puts "whenever setting crontab to STASH_ENV=#{ENV['STASH_ENV']} /dash2/dash2-harvester/current/bin/harvest.sh"

every 15.minutes do
  # TODO: configure environment in some less-hacky way
  command "STASH_ENV=#{ENV['STASH_ENV']} /dash2/dash2-harvester/current/bin/harvest.sh"
end
