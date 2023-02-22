# frozen_string_literal: true

class AddContactPhoneAndContactEmailToOrganizerDetails < ActiveRecord::Migration[6.1]
  def change
    add_column :organizer_details, :contact_phone, :string
    add_column :organizer_details, :contact_email, :string
  end
end
