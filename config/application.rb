require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Chuych
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The available locales for the Exchange. The rails-i18n adds several
    # locales that will not be used. This setting reduces the set to locales we
    # want included.
    config.i18n.available_locales = [:en, :es]

    # Enforce that only valid locales are used.
    # http://stackoverflow.com/a/20381730
    config.i18n.enforce_available_locales = true

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'Eastern Time (US & Canada)'

    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters += [:password, :credit_card_number, :ccv]

      config.generators do |g|
        g.test_framework :rspec,
          fixtures: true,
          view_specs: false,
          helper_specs: false,
          routing_specs: false,
          controller_specs: true,
          request_specs: false
        g.fixture_replacement :factory_girl, dir: "spec/factories"
      end

    config.assets.initialize_on_precompile = false
    # config.active_record.whitelist_attributes = false

    # want the application to raise an error if an invalid locale is passed (or)
    # want to default to the new Rails behaviors (or)
    # care about locale validation
    #
    config.i18n.enforce_available_locales = true
  end
end
