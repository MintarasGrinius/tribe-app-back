# frozen_string_literal: true

class UserDetail < ApplicationRecord
  has_many :social_profiles, as: :sociable
  has_many :photos, as: :photoable, dependent: :destroy

  belongs_to :user
end
