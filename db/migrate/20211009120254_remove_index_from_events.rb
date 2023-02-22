# frozen_string_literal: true

class RemoveIndexFromEvents < ActiveRecord::Migration[6.1]
  def change
    remove_index :events, name: 'index_events_on_organizer_id'
  end
end
