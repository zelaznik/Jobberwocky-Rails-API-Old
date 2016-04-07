class Api::V1::CallbacksController < Devise::OmniauthCallbacksController
  def github
    debugger
    @user = User.from_omniauth(request.env["omniauth.auth"])
    sign_in_and_redirect @user
  end
end
