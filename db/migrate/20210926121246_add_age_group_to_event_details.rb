# frozen_string_literal: true

class AddAgeGroupToEventDetails < ActiveRecord::Migration[6.1]
  def change
    add_column :event_details, :age_group, :string
  end
end
