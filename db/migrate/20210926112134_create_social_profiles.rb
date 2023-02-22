# frozen_string_literal: true

class CreateSocialProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :social_profiles do |t|
      t.string :title
      t.string :url
      t.references :sociable, polymorphic: true
      t.timestamps
    end
  end
end
