# frozen_string_literal: true

class User < ApplicationRecord
  acts_as_token_authenticatable

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         # :confirmable


  alias_attribute :details, :user_details
  alias_attribute :settings, :user_settings

  has_many :event_users
  has_many :liked_events, -> { where("event_users.status": 'like') }, class_name: 'Event', through: :event_users, source: :event
  has_many :disliked_events, -> { where("event_users.status": 'dislike') }, class_name: 'Event', through: :event_users, source: :event
  has_many :events, through: :event_users, source: :event
  has_many :qr_codes, dependent: :destroy
  has_many :reviews, as: :reviewable, dependent: :destroy
  has_one :user_details, class_name: 'UserDetail', dependent: :destroy
  has_one :user_settings, class_name: 'UserSetting', dependent: :destroy
  has_one :organizer, dependent: :destroy

  validates_presence_of :email
  validates :email, email: true, length: { maximum: 100 }, uniqueness: true

  # def user_data
  #   render json:
  # end

  def show
    render json: current_user.merge
  end

  def organizer?
    Organizer.find_by(user_id: id).present?
  end
end
