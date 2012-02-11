require 'simplecov'
SimpleCov.start 'rails'

require 'rubygems'
require 'spork'


if Spork.using_spork?

  ActiveSupport::Dependencies.clear
  ActiveRecord::Base.instantiate_observers

  Spork.prefork do
    # This file is copied to spec/ when you run 'rails generate rspec:install'
    ENV['RAILS_ENV'] ||= 'test'
    require File.expand_path('../../config/environment', __FILE__)
    require 'rspec/rails'
    require 'rspec/autorun'


    # Set Capybaa javascript driver
    Capybara.javascript_driver = :webkit


    # Requires supporting ruby files with custom matchers and macros, etc,
    # in spec/support/ and its subdirectories.
    Dir[Rails.root.join('spec/support/**/*.rb')].each {|f| require f}

    RSpec.configure do |config|
      # ## Mock Framework
      #
      # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
      #
      # config.mock_with :mocha
      # config.mock_with :flexmock
      # config.mock_with :rr
      config.mock_with :rspec

      # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
      # config.fixture_path = Rails.root.join('spec/fixtures')

      # If you're not using ActiveRecord, or you'd prefer not to run each of your
      # examples within a transaction, remove the following line or assign false
      # instead of true.
      # config.use_transactional_fixtures = true

      # If true, the base class of anonymous controllers will be inferred
      # automatically. This will be the default behavior in future versions of
      # rspec-rails.
      config.infer_base_class_for_anonymous_controllers = false

      config.before :suite do
        DatabaseCleaner.strategy = :transaction
        DatabaseCleaner.clean_with :truncation
      end

      config.before :each do
        DatabaseCleaner.start
      end

      config.after :each do
        DatabaseCleaner.clean
      end
    end
  end

  Spork.each_run do
    require 'factory_girl_rails'

    I18n.backend.reload!

    Dir[Rails.root.join('lib/**/*.rb')].each {|f| load f }
    Dir[Rails.root.join('spec/support/**/*.rb')].each {|f| load f}

    # reload routes
    PrimaRewal::Application.reload_routes!
  end

end