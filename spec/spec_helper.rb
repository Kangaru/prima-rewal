if ENV['COVERAGE']
require 'simplecov'
SimpleCov.start 'rails'
end

require 'rubygems'
require 'spork'


Spork.prefork do
  # This file is copied to spec/ when you run 'rails generate rspec:install'
  ENV['RAILS_ENV'] ||= 'test'
  require File.expand_path('../../config/environment', __FILE__)
  require 'rspec/rails'
  require 'rspec/autorun'


  # Set default locale to english
  I18n.locale = :en
  I18n.default_locale = :en


  # Set Capybaa javascript driver
  require 'capybara/poltergeist'
  Capybara.javascript_driver = :poltergeist


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
    config.use_transactional_fixtures = false

    # If true, the base class of anonymous controllers will be inferred
    # automatically. This will be the default behavior in future versions of
    # rspec-rails.
    config.infer_base_class_for_anonymous_controllers = false

    config.include ActionView::TestCase::Behavior, example_group: { file_path: %r{spec/presenters} }
    config.include AdminRequestsSpecsOptions, example_group: { file_path: %r{spec/requests/admin} }
    config.include Devise::TestHelpers, type: :controller

    config.before :suite do
      DatabaseCleaner.strategy = :deletion
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