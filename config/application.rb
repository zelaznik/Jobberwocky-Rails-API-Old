require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

# This Rails Version Was Before secrets.yml so I made my own.
def json_secrets
  return @secrets unless @secrets.nil?
  src = Rails.root.join('config', 'secrets.json')

  @secrets ||= File.open(src, 'r') do |f|
    all_values = JSON.parse(f.read)
    all_values[Rails.env].freeze
  end
end

EnvOrSecret = Hash.new do |h,k|
  e = ENV[k]
  j = json_secrets[k]
  if (j.nil? || e.nil?)
    h[k] = (e || j)
  else
    raise "The variable #{k} is specified more than once."
  end
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
        origins '*'
        resource '*',
                 headers: :any,
                 methods: [:get, :put, :post, :patch, :delete, :options]
      end
    end

    config.middleware.insert_before 'Rack::Runtime', 'Rack::Cors' do
      allow do
        origins EnvOrSecret["FRONT_END_URL"]
        resource '*', :headers => :any, :methods => [:get, :post, :delete, :options]
      end
    end

  end
end
