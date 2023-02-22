# frozen_string_literal: true

class CreateEventDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :event_details do |t|
      t.bigint :capacity
      t.text :description
      t.string :dress_code
      t.boolean :own_drinks
      t.string :location
      t.datetime :time
      t.string :title
      t.bigint :event_id
      t.timestamps

      t.index ['event_id'], name: 'index_event_details_on_event_id'
    end
  end
end
