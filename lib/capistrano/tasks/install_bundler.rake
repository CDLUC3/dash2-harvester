namespace :install do
  desc 'Install/update bundler'
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
