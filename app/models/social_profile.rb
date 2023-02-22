# frozen_string_literal: true

class SocialProfile < ApplicationRecord
  belongs_to :sociable, polymorphic: true
end
