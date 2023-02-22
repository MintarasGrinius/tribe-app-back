# frozen_string_literal: true

class CreateHiddenEventDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :hidden_event_details do |t|
      t.bigint :event_id
      t.string :contact_email
      t.string :contact_phone
      t.string :location
      t.timestamps

      t.index ['event_id'], name: 'index_hidden_event_details_on_event_id', unique: true
    end
  end
end
