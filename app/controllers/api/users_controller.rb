# frozen_string_literal: true

class Api::UsersController < ApplicationController
  before_action :authorized, except: %w[create login logout]

  def create
    @user = User.create(user_params)
    if @user.valid?
      token = encode_token(user_id: @user.id)
      render json: { success: true, user: { email: @user.email, id: @user.id }, token: token }
    else
      render json: { success: false, error: @user.errors.full_messages }
    end
  end

  def login
    @user = User.find_by(email: user_params[:email])

    if @user&.authenticate(user_params[:password])
      token = encode_token(user_id: @user.id)
      return render json: { success: true, user: { email: @user.email, id: @user.id }, token: token }
    else
      return render json: { success: false, error: 'Invalid username or password' }
    end
  end

  def logout
    return render json: { success: true } if params[:token].blank?

    device_token = logged_in_user.device_tokens.find_by(token: params[:token])

    return render json: { success: true } if device_token.blank?

    if device_token.destroy
      render json: { success: true }
    else
      render json: { success: false }
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
