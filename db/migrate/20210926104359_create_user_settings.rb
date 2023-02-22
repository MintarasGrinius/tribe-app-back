# frozen_string_literal: true

class CreateUserSettings < ActiveRecord::Migration[6.1]
  def change
    create_table :user_settings do |t|
      t.string :location
      t.integer :radius
      t.bigint :user_id
      t.timestamps

      t.index ['user_id'], name: 'index_user_settings_on_user_id', unique: true
    end
  end
end
