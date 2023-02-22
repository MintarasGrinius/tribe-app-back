# frozen_string_literal: true

module Api
  class V1::EventsController < Api::ApiController
    include EventsHelper
    
    before_action :event_params, only: :update
    before_action :check_params, only: %i[create update]
    before_action :set_event, except: %i[create new index]
    before_action :set_event_detail, only: :update
    before_action :set_events, only: :index
    
    def index
      render 'api/v1/events/index'
    end

    def create
      event = Event.new(event_params.except(:photos))
      event.organizer = current_user.organizer
      event_params[:photos]&.each do |photo|
        next unless photo.present?

        event.details.photos.build(storage_url: photo)
      end

      return render json: { is_success: true, errors: event.errors, data: {} }, status: :unprocessable_entity unless event.save

      render json: { is_success: true, data: { event: event, details: event.event_details, organizer: event.organizer, photos: event.details.photos } }, status: :ok
    end

    def show
      render json: { is_success: true, event: @event, details: @event.event_details, organizer: @event.organizer, photos: @event.details.photos }, status: :ok
    end

    def edit
      render json: {
        errors: ['Not implemented']
      }
    end

    def update
      @event_detail.update(
        { 
          capacity: params[:event][:event_details_attributes][:capacity].to_i,
          description: params[:event][:event_details_attributes][:description],
          dress_code: params[:event][:event_details_attributes][:dress_code],
          own_drinks: params[:event][:event_details_attributes][:own_drinks],
          location: params[:event][:event_details_attributes][:location],
          title: params[:event][:event_details_attributes][:title],
          updated_at: Time.now,
          category: params[:event][:event_details_attributes][:category],
          age_group:
            {
              from: params[:event][:event_details_attributes][:from].to_i,
              to: params[:event][:event_details_attributes][:to].to_i
            }
        }
      )

      render json: {
        errors: ['Not implemented']
      }
    end

    def destroy
      render json: {
        errors: ['Not implemented']
      }
    end

    def like
      e = current_user.liked_events

      if e&.find_by_id(@event.id).present?
        return render json: {
          errors: ['event already liked'],
          is_success: false,
          data: { liked_events: e }
        }, status: :unprocessable_entity
      end

      e << @event

      render json: {
        is_success: true,
        data: { liked_events: e }
      }, status: :ok
    end

    def dislike
      e = current_user.disliked_events

      if e&.find_by_id(@event.id).present?
        return render json: {
          errors: ['event already disliked'],
          is_success: false,
          data: { disliked_events: e }
        }, status: :unprocessable_entity
      end

      e << @event

      render json: {
        is_success: true,
        data: { disliked_events: e }
      }, status: :ok
    end

    private

    def set_event
      @event = Event.find(params[:id])
    end

    def set_event_detail
      @event_detail = EventDetail.find(params[:id])
    end

    def set_events
      @events = Event.all
      # @events = Event.all - current_user.events

      # @events = @events - current_user.organizer.events if current_user.organizer?
    end

    def event_params
      p 'params'
      p 'params'
      p 'params'
      p 'params'
      p 'params'
      p 'params'
      p 'params'
      p 'params'
      p 'params'
      p 'params'
      p params
      params.require(:event).permit(
        photos: [],
        event_details_attributes: [:capacity, :description, :dress_code, :own_drinks, :location, :time, :title, :category, { age_group: %i[from to] }],
        hidden_event_details_attributes: %i[contact_email contact_phone precise_location]
      )
    end

    def check_params
      unless current_user.organizer?
        render json: {
          errors: ['Not authorized as organizer'],
          is_success: false,
          data: {}
        }, status: :unprocessable_entity
      end

      return if params['event'].present? && params['event']['event_details_attributes'].present?

      render json: {
        errors: ['Missing Params'],
        is_success: false,
        data: {}
      }, status: :unprocessable_entity
    end
  end
end
