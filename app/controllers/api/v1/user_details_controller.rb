# frozen_string_literal: true

module Api
  class V1::UserDetailsController < Api::ApiController
    before_action :set_user, only: :create
    before_action :check_details, only: :create
    def create
      details = @user.build_user_details(details_params.except(:photos))

      details_params[:photos]&.each do |photo|
        next unless photo.present?

        details.photos.build(storage_url: photo)
      end

      return render json: { is_success: true, errors: event.errors, data: {} }, status: :unprocessable_entity unless details.save

      render json: { is_success: true, data: { details: details, photos: details.photos }, status: :ok }
    end

    private

    def details_params
      params.require(:user_details).permit(:date_of_birth, :first_name, :last_name, :gender, :photos => [])
    end

    def check_details
      render json: { is_success: false, errors: ["details for this user already exist"], data: {}}, status: 409 if @user.details.present?
    end
  end
end