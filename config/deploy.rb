# config valid only for current version of Capistrano
# lock '3.4.0'

set :application, 'dash2-harvester'
set :repo_url, 'git@github.com:CDLUC3/dash2-harvester.git'
set :deploy_to, '/dash2/dash2-harvester'

# Default value for linked_dirs is []
# set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

set :linked_dirs, fetch(:linked_dirs, []).push('log', 'db')

# Default value for default_env is {}
# set :default_env, { path: "/dash2/dash2-harvester/bin:$PATH" }

namespace :deploy do

end
