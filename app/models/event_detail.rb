# frozen_string_literal: true

class EventDetail < ApplicationRecord
  serialize :age_group
  has_many :photos, as: :photoable, dependent: :destroy

  belongs_to :event, inverse_of: :event_details
end
