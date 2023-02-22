# frozen_string_literal: true

class HiddenEventDetail < ApplicationRecord
  belongs_to :event, inverse_of: :hidden_event_details
end
