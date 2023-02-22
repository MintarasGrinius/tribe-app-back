# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  namespace :auth, defaults: { format: :json } do
    devise_scope :user do
      post 'sign_up', to: 'registrations#create'
      post 'sign_in', to: 'sessions#create'
      get 'sign_in', to: 'sessions#new'
      get 'confirmation', to: 'confirmations#show'
    end
  end

  namespace 'api', defaults: { format: :json } do
    namespace 'v1' do
      resources :events do
        post 'like', on: :member, to: 'events#like'
        post 'dislike', on: :member, to: 'events#dislike'
      end
      resources :organizers do
        get 'events', on: :member, to: 'organizers#events'
      end
      resources :users do
        get 'user_data', on: :collection, to: 'users#user_data'
        post 'user_details', on: :collection, to: 'user_details#create'
      end
    end
  end
end
