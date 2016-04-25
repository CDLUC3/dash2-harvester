namespace :prepare do
  desc 'Install commands from schedule.rb in crontab file'
  task :install_crontab do
    on roles(:all) do |host|
     execute "cd #{release_path} && STASH_ENV=#{fetch(:stash_env)} bundle exec whenever --update-crontab dash2-harvester && crontab -l"
   end
  end
end
