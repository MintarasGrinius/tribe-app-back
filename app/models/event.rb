# frozen_string_literal: true

class Event < ApplicationRecord
  alias_attribute :hidden_details, :hidden_event_details
  alias_attribute :details, :event_details

  has_many :users, through: :event_users
  has_many :event_users
  has_many :qr_codes, dependent: :destroy
  has_many :reviews, as: :reviewable, dependent: :destroy

  has_one :event_details, class_name: 'EventDetail', dependent: :destroy, inverse_of: :event
  has_one :hidden_event_details, class_name: 'HiddenEventDetail', dependent: :destroy, inverse_of: :event

  belongs_to :organizer

  accepts_nested_attributes_for :event_details
  accepts_nested_attributes_for :hidden_event_details

  validates_associated :event_details, :hidden_event_details
end
