# frozen_string_literal: true

class QrCode < ApplicationRecord
  belongs_to :user
  belongs_to :event
end
