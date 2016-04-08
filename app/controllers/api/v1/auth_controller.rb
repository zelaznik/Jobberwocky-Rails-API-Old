class Api::V1::AuthController < ApplicationController
  def github
    settings = {
        url: 'https://github.com/login/oauth/authorize',
        type: 'GET',
        query: {
            scope: 'user',
            client_id: '16f96b58b2b320779fdb',
            string: "#{Devise.friendly_token}",
            redirect_uri: 'http://api.jobberwocky.dev/auth/callback'
        }
    }
    query_pairs = URI.encode_www_form(settings[:query].to_a)
    full_url = "#{settings[:url]}?#{query_pairs}"
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
