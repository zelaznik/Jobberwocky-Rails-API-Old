Rails.application.config.middleware.use OmniAuth::Builder do
  provider  :github,
            EnvOrSecret["GITHUB_CLIENT_ID"],
            EnvOrSecret["GITHUB_CLIENT_SECRET"],
            scope: 'user:email'
end
