class Api::V1::UsersController < ApplicationController
  before_action :authenticate_with_token!, only: [:update, :destroy]

  def show
    respond_with User.find(params[:id])
  end

  def index
    respond_with User.all
  end

  def create
    user = User.new(user_params)
    if user.save
      user.generate_authentication_token!
      user.save
      data = {user: {id: user.id, email: user.email, auth_token: user.auth_token}}
      render json: data, status: 201, location: [:api, user] #, serializer: CurrentUserSerializer
    else
      render json: { errors: user.errors }, status: 422
    end
  end

  def update
    user = current_user
    if user.update(user_params)
      render json: user, status: 200, location: [:api, user]
    else
      render json: { errors: user.errors }, status: 422
    end
  end

  def destroy
    current_user.destroy
    head 204
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
