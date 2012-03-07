require 'bundler/capistrano'

set :application, "prima_rewal"

set :deploy_to, '/home/prima/www/prima-rewal'
set :user,      'prima'

set :scm,        'git'
set :scm_user,   'zlw'
set :repository, 'git://github.com/Kangaru/prima-rewal.git'
set :branch,     'master'


role :web, 'prima.megiteam.pl'                # Your HTTP server, Apache/etc
role :app, 'prima.megiteam.pl'                # This may be the same as your `Web` server
role :db,  'prima.megiteam.pl', primary: true # This is where Rails migrations will run
# role :db,  "your slave db-server here"

set :use_sudo, false

after 'deploy:update_code',     'deploy:assets_precompile'

after 'deploy:setup',           'deploy:db:setup'
after 'deploy:setup',           'deploy:mailer:setup'

after 'deploy:finalize_update', 'deploy:db:symlink'
after 'deploy:finalize_update', 'deploy:mailer:symlink'

namespace :deploy do
   task :start do; end
   task :stop do; end
   task :restart, roles: :app, except: { no_release: true } do
     run "restart-app #{application}"
   end
end

namespace :deploy do
  task :assets_precompile do
    run "cd #{release_path}; rm -rf public/assets/*"
    run "cd #{release_path}; RAILS_ENV=production bundle exec rake assets:precompile"
  end
end

namespace :deploy do
  namespace :mailer do
    task :setup, except: { no_release: true } do

      template = <<-EOF
      production
        address: 'smtp.gmail.com'
        port: 587
        domain: 'gmail.com'
        user_name: #{Capistrano::CLI.ui.ask("Enter SMTP username: ")}
        password:  #{Capistrano::CLI.ui.ask("Enter SMTP password: ")}
        authentication: 'plain'
        enable_starttls_auto: true
      EOF

      run "mkdir -p #{shared_path}/config"
      put template, "#{shared_path}/config/action_mailer.yml"
    end

    task :symlink, except: { no_release: true } do
      run "ln -nfs #{shared_path}/config/action_mailer.yml #{release_path}/config/action_mailer.yml"
    end
  end
end

namespace :deploy do
  namespace :db do
    task :setup, :except => { :no_release => true } do

      template = <<-EOF
      production:
        adapter: postgresql
        database: pg_7467
        username: pg_7467a
        password: #{Capistrano::CLI.ui.ask("Enter #{application} database password: ")}
        encoding: unicode
        pool: 5
        host: prima.megiteam.pl
        port: 5435
      EOF

      run "mkdir -p #{shared_path}/db"
      run "mkdir -p #{shared_path}/config"
      put template, "#{shared_path}/config/database.yml"
    end

    desc <<-DESC
      [internal] Updates the symlink for database.yml file to the just deployed release.
    DESC
    task :symlink, except: { no_release: true } do
      run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    end
  end
end