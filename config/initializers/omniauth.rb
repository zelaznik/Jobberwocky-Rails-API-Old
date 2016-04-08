Rails.application.config.middleware.use OmniAuth::Builder do
  provider  :github,
            json_secrets["GITHUB_CLIENT_ID"],
            json_secrets["GITHUB_CLIENT_SECRET"],
            scope: 'user:email'
end
