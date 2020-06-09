class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user && password_verified?(user)
      render json: UserSerializer.new(user)
    elsif user.nil?
      email_error = Error.new(no_user_message) if user.nil?
      render json: ErrorSerializer.new(email_error), status: :not_found
    else
      password_error = Error.new(bad_password_message)
      render json: ErrorSerializer.new(password_error), status: :unauthorized
    end
  end

  private

  def password_verified?(user)
    user.authenticate(params[:password])
  end

  def no_user_message
    'Email does not exist in our system, please sign up.'
  end

  def bad_password_message
    'Bad Credentials, You have entered the wrong password.'
  end
end
