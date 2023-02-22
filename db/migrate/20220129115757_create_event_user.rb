class CreateEventUser < ActiveRecord::Migration[6.1]
  def change
    create_table :event_users do |t|
        t.string :status
        t.bigint :user_id
        t.bigint :event_id
        t.timestamps

        t.index ['event_id'], name: 'index_event_users_on_event_id'
        t.index ['user_id'], name: 'index_event_users_on_user_id'
    end
  end
end
