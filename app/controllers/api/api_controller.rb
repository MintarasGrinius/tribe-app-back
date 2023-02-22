# frozen_string_literal: true

module Api
  class ApiController < ApplicationController
    respond_to :json

    def set_user
      @user ||= User.find_by(authentication_token: request.headers['X-User-Token'])
    end
  end
end
