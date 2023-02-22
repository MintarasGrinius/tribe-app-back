# frozen_string_literal: true

class OrganizerDetail < ApplicationRecord
  has_many :social_profiles, as: :sociable

  belongs_to :organizer
end