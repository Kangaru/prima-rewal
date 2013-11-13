source 'https://rubygems.org'

gem 'rails', '3.2.11'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

# Gems for db
group :development, :test do
  gem 'sqlite3'
end

group :production do
  gem 'pg'

  gem 'eventmachine', '0.12.8' # for Thin
  gem 'daemons',      '1.0.10' # for Thin
  gem 'thin', '1.4.1'
end

# Authorization
gem 'devise'

# ActiveAdmin & additional gems
gem 'activeadmin'
gem "meta_search", "~> 1.1.3"

# Misc
gem 'haml'
gem 'param_protected'
gem 'polish'
gem 'globalize3', git: 'git://github.com/svenfuchs/globalize3.git', ref: '36430511'
gem 'easy_globalize3_accessors'
gem 'acts_as_list'
gem 'simple_form'
gem 'redcarpet'
gem 'i18n_routing'
gem 'active_attr', git: 'git://github.com/cgriego/active_attr.git', ref: '76bc62885'
gem 'fb_graph'
gem 'stringex'

# Widgets/Cells
gem 'apotomo'
gem 'cells'

gem 'named_accessors'
gem 'action_presenter'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.4'
  gem 'coffee-rails', '~> 3.2.2'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer'

  gem 'uglifier', '>= 1.2.3'

  gem 'bootstrap-sass'
end

gem 'jquery-rails'
gem 'fancybox-rails', git: 'git://github.com/sverigemeny/fancybox-rails.git', ref: '17db8865'

group :development, :test do
  gem 'rspec-rails'
  gem 'database_cleaner'
  gem 'shoulda-matchers'
  gem 'factory_girl_rails', require: false
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'launchy'
  gem 'spork', '~> 1.0.0rc2'
  gem 'simplecov', require: false

  gem 'rspec-cells'
  gem 'rspec-apotomo'
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'
