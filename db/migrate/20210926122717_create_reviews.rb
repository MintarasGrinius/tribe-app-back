# frozen_string_literal: true

class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.decimal :score
      t.text :review
      t.references :reviewable, polymorphic: true
      t.timestamps
    end
  end
end
