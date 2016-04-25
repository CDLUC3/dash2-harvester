namespace :prepare do
  desc 'Install bundler, if not already installed'
  task :bundler do
    on roles(:all) do |host|
      if test('which bundle')
        info "Bundler is already installed on #{host}"
      else
        execute 'gem install bundler'
      end
    end
  end
end
