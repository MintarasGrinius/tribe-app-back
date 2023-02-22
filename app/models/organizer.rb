# frozen_string_literal: true

class Organizer < ApplicationRecord
  alias_attribute :details, :organizer_details
  alias_attribute :settings, :organizer_settings

  has_many :events, dependent: :destroy
  has_many :social_profiles, as: :sociable, dependent: :destroy
  has_one :organizer_settings, class_name: 'OrganizerSetting', dependent: :destroy
  has_one :organizer_details, class_name: 'OrganizerDetail', dependent: :destroy

  belongs_to :user, foreign_key: :user_id
end
