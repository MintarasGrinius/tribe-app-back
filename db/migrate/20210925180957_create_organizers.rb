# frozen_string_literal: true

class CreateOrganizers < ActiveRecord::Migration[6.1]
  def change
    create_table :organizers do |t|
      t.bigint :user_id
      t.timestamps

      t.index ["user_id"], { name: "index_organizers_on_users_id"}
    end
  end
end
