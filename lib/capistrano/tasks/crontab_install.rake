namespace :crontab do
  desc 'Install commands from schedule.rb in crontab file'
  task :install do
    on roles(:all) do |host|
     execute "cd #{release_path} && STASH_ENV=#{fetch(:stash_env)} bundle exec whenever --update-crontab && crontab -l"
   end
  end
end
