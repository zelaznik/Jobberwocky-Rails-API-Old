module Authenticable
  def current_user
    @current_user ||= User.find_by(auth_token: request.headers['Authorization'])
  end

  def authenticate_with_token!
    unless current_user.present?
      render json: { errors: "Not authenticated" }, status: :unauthorized
     end
  end

  def user_signed_in?
    current_user.present?
  end

  def self.allow_cors(*methods)
    before_filter :cors_before_filter, only: methods
    protect_from_forgery with: :null_session, only: methods
  end

  def cors_before_filter
    headers['Access-Control-Allow-Origin'] = request.headers['Origin']
  end
end
