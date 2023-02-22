# frozen_string_literal: true

module Api
  class V1::OrganizersController < Api::ApiController
    before_action :check_params, except: %i[events]
    before_action :set_organizer, only: %i[show edit update destroy]

    def create
      organizer_details = OrganizerDetail.new(organizer_params['organizer_details'])
      organizer = Organizer.new(organizer_details: organizer_details, user: current_user)

      unless organizer_params['social_profiles'].blank?
        organizer_params['social_profiles'].each do |profile|
          organizer.social_profiles << SocialProfile.new(profile)
        end
      end

      if organizer.save
        render json: {
          success: true,
          data: {
            organizer: organizer,
            details: organizer.organizer_details,
            social_profiles: organizer.social_profiles
          }
        }
      else
        render json: {
          errors: organizer.errors,
          success: false
        }
      end
    end

    def events
      render json: { is_success: true, events: Organizer.find(params[:id]).events.map(&:event_details) }, status: :ok
    end

    private

    def set_organizer
      @organizer = Organizer.find(params[:id])
    end

    def organizer_params
      params.require(:organizer).permit(organizer_details: %i[kind name contact_phone contact_email], social_profiles: %i[title url])
    end

    def check_params
      if current_user.organizer?
        render json: {
          errors: ['Already organizer'],
          is_success: false,
          data: {}
        }, status: :unprocessable_entity
      end

      return if params['organizer'].present? && params['organizer']['organizer_details'].present?

      render json: {
        errors: ['Missing Params'],
        is_success: false,
        data: {}
      }, status: :unprocessable_entity
    end
  end
end
