# frozen_string_literal: true

json.array! @events do |event|
  json.event_id event.id

  if event.details.present?
    json.call(event.details, :id, :capacity, :description, :dress_code, :own_drinks, :location, :time, :title, :category, :age_group) if event.details.present?
    json.status current_user.liked_events.find_by_id(event.id).present? ? 'liked' : current_user.disliked_events.find_by_id(event.id).present? ? 'disliked' : '' 
    if event.details.photos.any?
      json.photos event.details.photos.map {|p| p.storage_url}
    end
  end
end
