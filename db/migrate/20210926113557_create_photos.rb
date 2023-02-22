# frozen_string_literal: true

class CreatePhotos < ActiveRecord::Migration[6.1]
  def change
    create_table :photos do |t|
      t.string :storage_url
      t.references :photoable, polymorphic: true
      t.timestamps
    end
  end
end
