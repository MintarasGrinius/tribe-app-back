# frozen_string_literal: true

class Auth::ConfirmationsController < Devise::ConfirmationsController
  respond_to :json

  STATUSES = {
    pending: 'pending',
    expired: 'expired',
    completed: 'completed'
  }.freeze

  def create
    self.resource = resource_class.send_confirmation_instructions(resource_params)
    yield resource if block_given?

    if successfully_sent?(resource)
      # resource.change_confirmation_status(STATUSES.pending)
      respond_with({}, location: after_resending_confirmation_instructions_path_for(resource_name))
    else
      respond_with(resource)
    end
  end

  def show
    self.resource = resource_class.confirm_by_token(params[:confirmation_token])
    yield resource if block_given?

    if resource.errors.empty?
      sign_in 'user', resource
      render json: {
        is_success: true,
        data: {
          auth_token: @user.authentication_token
        }
      }, status: :ok
    else
      render json: {
        is_success: false,
        data: {}
      }, status: :unprocessable_entity
    end
  end

  ## TODO
  # Add expired logic
  # Add confirmation link
end