namespace :crontab do
  desc 'Create crontab file'
  task :install do
    on roles(:all) do |host|
     execute "cd #{release_path} && bundle exec whenever --update-crontab STASH_ENV=#{fetch(:stash_env)}"
   end
  end
end
