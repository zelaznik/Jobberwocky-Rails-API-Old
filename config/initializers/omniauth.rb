OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, EnvOrSecret["GITHUB_CLIENT_ID"], EnvOrSecret["GITHUB_CLIENT_SECRET"], scope: 'user:email'
  provider :facebook, EnvOrSecret["FACEBOOK_APP_ID"], EnvOrSecret["FACEBOOK_APP_SECRET"]
end
