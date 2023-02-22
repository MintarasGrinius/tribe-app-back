# frozen_string_literal: true

class RemoveAndColumnsToEvents < ActiveRecord::Migration[6.1]
  def change
    remove_column :events, 'capacity'
    remove_column :events, 'description'
    remove_column :events, 'dress_code'
    remove_column :events, 'own_drinks'
    remove_column :events, 'location'
    remove_column :events, 'time'
    remove_column :events, 'title'
  end
end
