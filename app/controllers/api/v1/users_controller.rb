class Api::V1::UsersController < ApplicationController
  def create
    new_user = User.new(user_params)
    if new_user.save
      render json: UserSerializer.new(new_user), status: :created
    else
      error = Error.new(new_user)
      render json: ErrorSerializer.new(error), status: :unprocessable_entity
    end
  end

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
