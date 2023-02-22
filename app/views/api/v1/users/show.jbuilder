# frozen_string_literal: true

json.user do
  json.id @user.id
  json.email @user.email
  json.is_organizer @user.organizer?
end