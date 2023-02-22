# frozen_string_literal: true

class AddCategoryToEventDetails < ActiveRecord::Migration[6.1]
  def change
    add_column :event_details, :category, :string
  end
end
