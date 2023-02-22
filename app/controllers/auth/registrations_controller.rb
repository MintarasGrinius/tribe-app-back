# frozen_string_literal: true

class Auth::RegistrationsController < Devise::RegistrationsController
  before_action :check_params, only: :create

  def create
    user = User.new(user_params)

    if user.save
      render json: { is_success: true, user: user }, status: :ok
    else
      render json: { errors: user.errors }, status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def check_params
    return if params[:user].present?
    render json: {
      errors: ["Missing Params"],
      is_success: false,
      data: {}
    }, status: :unprocessable_entity
  end
end