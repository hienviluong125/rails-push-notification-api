class Api::DeviceTokensController < ApplicationController
  before_action :authorized, only: [:create]

  def create
    device_token = logged_in_user.device_tokens.new(device_token_params)

    if device_token.save
      return render json: { success: true, device_token: device_token }
    else
      return render json: { success: false, error: device_token.errors.full_messages }
    end
  end

  private

  def device_token_params
    params.require(:device_token).permit(:token)
  end
end