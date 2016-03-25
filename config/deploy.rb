require 'rvm/capistrano'
require 'bundler/capistrano'
load 'deploy/assets'

set :workouts, %w(staging)
set :default_workout, "staging"
require 'capistrano/ext/multiworkout'

set :application, "getfit"
set :deploy_to, "/home/getfit/#{application}"
set :use_sudo, false
set :unicorn_conf, "#{deploy_to}/current/config/unicorn.rb"
set :unicorn_pid, "#{deploy_to}/shared/pids/unicorn.pid"
set :normalize_asset_timestamps, false
set :rvm_ruby_string, 'ruby-2.3.0@getfit'

set :scm, :git
set :repository, "git@github.com:BinaryBlitz/getfit.git"
set :deploy_via, :remote_cache

before 'deploy:setup', 'rvm:install_rvm', 'rvm:install_ruby'

# before 'deploy', 'rpush:stop'

after 'deploy:update_code', :roles => :app do
  # Config
  run "rm -f #{current_release}/config/secrets.yml"
  run "ln -nfs #{deploy_to}/shared/config/secrets.yml #{current_release}/config/secrets.yml"

  run "rm -f #{current_release}/config/pushcert.pem"
  run "ln -nfs #{deploy_to}/shared/config/pushcert.pem #{current_release}/config/pushcert.pem"

  # Database
  run "rm -f #{current_release}/config/database.yml"
  run "ln -nfs #{deploy_to}/shared/config/database.yml #{current_release}/config/database.yml"

  # Uploads
  run "rm -f #{current_release}/public/uploads"
  run "ln -nfs #{deploy_to}/shared/public/uploads #{current_release}/public/uploads"

  # Migrations
  run "cd #{current_release}; bundle exec rake db:migrate RAILS_ENV=#{rails_env}"

  # Pids
  run "rm -f #{current_release}/tmp/pids"
  run "ln -nfs #{deploy_to}/shared/pids #{current_release}/tmp/pids"
end

# after 'deploy:create_symlink', 'rpush:stop', 'rpush:start'
before 'deploy:assets:precompile', 'deploy:link_db'

set :keep_releases, 3
after "deploy:restart", "deploy:cleanup"

namespace :deploy do
  task :link_db do
    run "rm -f #{current_release}/config/database.yml"
    run "ln -nfs #{deploy_to}/shared/config/database.yml #{current_release}/config/database.yml"
  end
  task :restart do
    run "if [ -f #{unicorn_pid} ] && [ -e /proc/$(cat #{unicorn_pid}) ]; then kill -USR2 `cat #{unicorn_pid}`; else cd #{deploy_to}/current && bundle exec unicorn -c #{unicorn_conf} -E #{rails_env} -D; fi"
  end
  task :start do
    run "cd #{current_path}; bundle exec unicorn -c #{unicorn_conf} -E #{rails_env} -D"
  end
  task :stop do
    run "if [ -f #{unicorn_pid} ] && [ -e /proc/$(cat #{unicorn_pid}) ]; then kill -QUIT `cat #{unicorn_pid}`; fi"
  end
end

namespace :rpush do
  task :stop do
    run "cd #{deploy_to}/current; bundle exec rpush stop --rails-env=#{rails_env}; true"
  end

  task :start do
    run "cd #{deploy_to}/current; bundle exec rpush start --rails-env=#{rails_env}"
  end
end
