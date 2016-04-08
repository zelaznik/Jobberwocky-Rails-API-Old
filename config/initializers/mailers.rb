module Jobberwocky
  class Application < Rails::Application

    config.action_mailer.default_url_options = { :host => EnvOrSecret["ROOT_URL"] }
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.perform_deliveries = true
    config.action_mailer.raise_delivery_errors = false
    config.action_mailer.default :charset => "utf-8"

    config.action_mailer.smtp_settings = {
        address: "smtp.gmail.com",
        port: 587,
        domain: EnvOrSecret["ROOT_URL"],
        authentication: "plain",
        enable_starttls_auto: true,
        user_name: EnvOrSecret["GMAIL_USERNAME"],
        password:  EnvOrSecret["GMAIL_PASSWORD"]
    }
  end
end
