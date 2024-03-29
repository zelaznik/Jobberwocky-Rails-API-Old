Jobberwocky::Application.configure do
  config.serve_static_assets = true
  config.cache_classes = true
  config.eager_load = true
  config.consider_all_requests_local = false

  # config.assets.js_compressor = :uglifier
  config.assets.compile = false
  config.assets.digest = true
  config.assets.version = '1.0'
  config.log_level = :info
  config.i18n.fallbacks = true
  config.active_support.deprecation = :notify
  config.log_formatter = ::Logger::Formatter.new

  config.action_controller.perform_caching = true

  # ENV['ROOT_URL'] =       Make sure these are
  # ENV['FRONT_END_URL'] =  set in production.
end
