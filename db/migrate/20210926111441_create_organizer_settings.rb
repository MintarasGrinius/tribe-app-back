# frozen_string_literal: true

class CreateOrganizerSettings < ActiveRecord::Migration[6.1]
  def change
    create_table :organizer_settings do |t|
      t.bigint :organizer_id
      t.timestamps

      t.index ['organizer_id'], name: 'index_organizer_settings_on_organizer_id', unique: true
    end
  end
end
