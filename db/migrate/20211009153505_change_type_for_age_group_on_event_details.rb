# frozen_string_literal: true

class ChangeTypeForAgeGroupOnEventDetails < ActiveRecord::Migration[6.1]
  def change
    change_column :event_details, :age_group, :text
  end
end
