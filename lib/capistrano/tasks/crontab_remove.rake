namespace :crontab do
  desc 'Remove installed schedule.rb commands from crontab file'
  task :remove do
    on roles(:all) do |host|
      execute "cd #{release_path} && bundle exec whenever -c $(realpath `pwd`)/config/schedule.rb && crontab -l"
    end
  end
end
