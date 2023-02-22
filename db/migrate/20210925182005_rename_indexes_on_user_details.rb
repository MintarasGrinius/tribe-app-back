# frozen_string_literal: true

class RenameIndexesOnUserDetails < ActiveRecord::Migration[6.1]
  def change
    rename_index "user_details", "index_user_details_on_users", "index_user_details_on_user_id"
    rename_index "user_details", "index_user_details_on_photos", "index_user_details_on_photo_id"
    rename_index "user_details", "index_user_details_on_social_profiles", "index_user_details_on_social_profile_id"
  end
end
