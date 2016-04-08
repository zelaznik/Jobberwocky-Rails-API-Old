class Api::V1::AuthController < ApplicationController
  def github
    settings = {
        url: 'https://github.com/login/oauth/authorize',
        type: 'GET',
        query: {
            scope: 'user',
            client_id: json_secrets["GITHUB_CLIENT_ID"],
            state: Devise.friendly_token,
            redirect_uri: 'http://api.jobberwocky.dev/auth/callback'
        }
    }

    key_val_pairs = settings[:query].to_a
    query_string = URI.encode_www_form(key_val_pairs)
    full_url = "#{settings[:url]}?#{query_string}"
    render json: {settings: settings, url: full_url}, status: 200
  end

  def new
    if params[:provider] == 'github'
      github
    else
      render json: { errors: "Not Found" }, status: 404
    end
  end

  def callback
    render json: {response: params}, status: 200
  end
end
