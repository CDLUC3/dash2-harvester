namespace :crontab do
  desc 'Create crontab file'
  task :install do
    on roles(:all) do |host|
      # execute "STASH_ENV=#{fetch(:stash_env)} && echo ${STASH_ENV}"
      execute "STASH_ENV=#{fetch(:stash_env)} && bundle exec whenever --update-crontab"
    end
  end
end
