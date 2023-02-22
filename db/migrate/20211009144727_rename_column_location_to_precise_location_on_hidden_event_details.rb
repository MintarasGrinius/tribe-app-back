class RenameColumnLocationToPreciseLocationOnHiddenEventDetails < ActiveRecord::Migration[6.1]
  def change
    rename_column :hidden_event_details, :location, :precise_location
  end
end
