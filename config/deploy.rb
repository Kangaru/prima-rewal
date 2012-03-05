require 'bundler/capistrano'

set :application, "prima-rewal"

set :deploy_to, '/home/prima/www/prima-rewal'
set :user, 'prima'

set :scm, :git
set :scm_user, 'zlw'
set :repository,  'git://github.com/Kangaru/prima-rewal.git'
set :branch, 'capistrano'


role :web, "prima.megiteam.pl"                # Your HTTP server, Apache/etc
role :app, "prima.megiteam.pl"                # This may be the same as your `Web` server
role :db,  "prima.megiteam.pl", primary: true # This is where Rails migrations will run
# role :db,  "your slave db-server here"

set :use_sudo, false


namespace :deploy do
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "restart-app #{application}"
   end
end

namespace :deploy do
  task :assets_precompile do
    run "cd #{release_path}; rm -rf public/assets/*"
    run "cd #{release_path}; RAILS_ENV=production bundle exec rake assets:precompile"
  end

  after 'deploy:update_code', 'deploy:assets_precompile'
end

namespace :deploy do
  namespace :db do
    desc <<-DESC
      Creates the database.yml configuration file in shared path.

      By default, this task uses a template unless a template \
      called database.yml.erb is found either is :template_dir \
      or /config/deploy folders. The default template matches \
      the template for config/database.yml file shipped with Rails.

      When this recipe is loaded, db:setup is automatically configured \
      to be invoked after deploy:setup. You can skip this task setting \
      the variable :skip_db_setup to true. This is especially useful \
      if you are using this recipe in combination with \
      capistrano-ext/multistaging to avoid multiple db:setup calls \
      when running deploy:setup for all stages one by one.
    DESC
    task :setup, :except => { :no_release => true } do

      template = <<-EOF
      production:
        adapter: postgresql
        database: pg_7467
        username: pg_7467a
        password: #{Capistrano::CLI.ui.ask("Enter #{application} database password: ")}
        encoding: unicode
        pool: 5
      EOF

      run "mkdir -p #{shared_path}/db"
      run "mkdir -p #{shared_path}/config"
      put template, "#{shared_path}/config/database.yml"
    end

    desc <<-DESC
      [internal] Updates the symlink for database.yml file to the just deployed release.
    DESC
    task :symlink, :except => { :no_release => true } do
      run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    end

  end

  after "deploy:setup",           "deploy:db:setup"   unless fetch(:skip_db_setup, false)
  after "deploy:finalize_update", "deploy:db:symlink"
end