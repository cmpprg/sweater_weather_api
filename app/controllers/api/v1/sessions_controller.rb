class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user && password_verified?(user)
      render json: UserSerializer.new(user)
    else
      error = set_error(user)
      render json: ErrorSerializer.new(error), status: :unauthorized
    end
  end

  private

  def user_exists_and_password_valid?
    user && password_verified?(user)
  end

  def set_error(user)
    message = user.nil? ? no_user_message : bad_password_message
    Error.new(message)
  end

  def password_verified?(user)
    @valid ||= user.authenticate(params[:password])
  end

  def no_user_message
    'Email does not exist in our system, please sign up.'
  end

  def bad_password_message
    'Bad Credentials, You have entered the wrong password.'
  end
end
