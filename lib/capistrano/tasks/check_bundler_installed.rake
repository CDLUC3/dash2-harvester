namespace :check do
  desc 'Check that bundler is installed'
  task :bundler_installed do
    on roles(:all) do |host|
      if test('[[ $(which bundle) ]]')
        info "Bundler is installed on #{host}"
      else
        error "Bundler is not installed on #{host}"
      end
    end
  end
end
