require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

EnvOrSecret = Hash.new do |h,k|
  h[k] = ENV[k] unless ENV[k].nil?
end

module Jobberwocky
  class Application < Rails::Application
    config.generators do |g|
      g.test_framework :rspec, fixture: true
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
      g.view_specs false
      g.helper_specs false
      g.stylesheets = false
      g.javascripts = false
      g.helper = false
    end

    config.i18n.enforce_available_locales = false
    config.autoload_paths += %W(#{config.root}/lib)
    config.middleware.insert_before 'Rack::Runtime', 'Rack::Cors' do
      allow do
        origins 'http://www.localhost:8080', 'http://www.jobberwocky.dev', 'http://www.jobberwocky.net'
        resource '*', :headers => :any, :methods => [:get, :post, :delete, :options]
      end
    end

  end
end
