# frozen_string_literal: true

class CreateUserDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :user_details do |t|
      t.date :date_of_birth
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.string :confirmation_status
      t.bigint :user_id
      t.bigint :photo_id # has_one
      t.bigint :social_profile_id # has_one
      t.timestamps

      t.index ['user_id'], name: 'index_user_details_on_users', unique: true
      t.index ['photo_id'], { name: 'index_user_details_on_photos', unique: true }
      t.index ['social_profile_id'], { name: 'index_user_details_on_social_profiles', unique: true }
    end
  end
end
