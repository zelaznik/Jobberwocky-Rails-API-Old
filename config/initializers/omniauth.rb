Rails.application.config.middleware.use OmniAuth::Builder do
  secrets_path = Rails.root.join('config','secrets.json');
  env = File.open(secrets_path, 'r') {|f| JSON.parse(f.read)[Rails.env] }

  provider :github, env["GITHUB_CLIENT_ID"], env["GITHUB_CLIENT_SECRET"], scope: 'user:email'
end
