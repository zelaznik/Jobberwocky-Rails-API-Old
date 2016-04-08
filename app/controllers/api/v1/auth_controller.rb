class Api::V1::AuthController < ApplicationController
  def github
    settings = {
        url: 'https://github.com/login/oauth/authorize',
        type: 'GET',
        query: {
            scope: 'user',
            state: Devise.friendly_token,
            client_id: EnvOrSecret["GITHUB_CLIENT_ID"],
            redirect_uri: "http://#{EnvOrSecret['ROOT_URL']}/auth/callback"
        }
    }

    key_val_pairs = settings[:query].map {|k,v| "#{k}=#{v}"}
    full_url = "#{settings[:url]}?#{key_val_pairs.join('&')}"
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
    json_archive = '{
        response: {
            code: "bfa7761fbb621f5ab60a",
            state: "Xmnc3WR-6M6Utt7rEm77",
            format: "json",
            controller: "api/v1/auth",
            action: "callback"
        }
    }'
    render json: {response: params}, status: 200
  end
end
