# frozen_string_literal: true

class RemoveIrrelevantIndexesAndColumns < ActiveRecord::Migration[6.1]
  def change
    remove_index :organizer_details, 'social_profile_id'
    remove_column :organizer_details, 'social_profile_id'

    remove_index :user_details, 'photo_id'
    remove_index :user_details, 'social_profile_id'
    remove_column :user_details, 'photo_id'
    remove_column :user_details, 'social_profile_id'
  end
end
