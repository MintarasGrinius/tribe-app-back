# frozen_string_literal: true

class EventUser < ApplicationRecord
  belongs_to :user
  belongs_to :event

  scope :liked, -> { where(status: 'like') }
  scope :disliked, -> { where(status: 'dislike') }
end
