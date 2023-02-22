# frozen_string_literal: true

class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.bigint :organizer_id
      t.bigint :capacity
      t.text :description
      t.string :dress_code
      t.boolean :own_drinks
      t.string :location
      t.datetime :time
      t.string :title
      t.timestamps

      t.index ['organizer_id'], name: 'index_events_on_organizer_id', unique: true
    end
  end
end
