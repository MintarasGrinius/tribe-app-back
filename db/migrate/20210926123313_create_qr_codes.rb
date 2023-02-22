class CreateQrCodes < ActiveRecord::Migration[6.1]
  def change
    create_table :qr_codes do |t|
      t.string :code
      t.bigint :user_id
      t.bigint :event_id
      t.timestamps

      t.index ['user_id'], name: 'index_qr_codes_on_user_id'
      t.index ['event_id'], name: 'index_qr_codes_on_event_id'
    end
  end
end
