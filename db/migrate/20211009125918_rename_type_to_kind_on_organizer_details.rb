class RenameTypeToKindOnOrganizerDetails < ActiveRecord::Migration[6.1]
  def change
    rename_column :organizer_details, :type, :kind
  end
end
