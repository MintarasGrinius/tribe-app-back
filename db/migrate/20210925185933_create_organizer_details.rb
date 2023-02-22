# frozen_string_literal: true

class CreateOrganizerDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :organizer_details do |t|
      t.string :type
      t.string :name
      t.bigint :organizer_id
      t.bigint :social_profile_id # has_one
      t.timestamps

      t.index ['organizer_id'], name: 'index_organizer_details_on_organizer_id', unique: true
      t.index ['social_profile_id'], { name: 'index_organizer_details_on_social_profile_id', unique: true }
    end
  end
end
