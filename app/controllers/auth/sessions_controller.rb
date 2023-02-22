# frozen_string_literal: true

class Auth::SessionsController < Devise::SessionsController
  before_action :load_user, only: :create

  def new
    self.resource = resource_class.new(sign_in_params)
    clean_up_passwords(resource)
    yield resource if block_given?

    respond_to do |format|
      format.html do
        render json: {
          is_success: true,
          data: resource
        }, status: :ok
      end
    end
  end

  # sign in
  def create
    if @user.valid_password?(sign_in_params[:password])
      sign_in 'user', @user
      render json: {
        is_success: true,
        data: {
          id: @user.id,
          auth_token: @user.authentication_token
        }
      }, status: :ok
    else
      render json: {
        errors: ['Unauthorized'],
        is_success: false
      }, status: :unauthorized
    end
  end

  private

  def sign_in_params
    params.require(:user).permit(:email, :password)
  end

  def load_user
    @user = User.find_for_database_authentication(email: sign_in_params[:email])

    return @user if @user

    render json: {
      errors: ['Cannot find user'],
      is_success: false
    }, status: :not_found
  end
end
