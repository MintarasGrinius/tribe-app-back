# frozen_string_literal: true

module Api
  class V1::UsersController < Api::ApiController
    before_action :set_user

    def user_data
      render 'api/v1/users/show'
    end
  end
end
