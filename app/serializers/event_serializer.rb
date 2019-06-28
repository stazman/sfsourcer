class EventSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :location, :date, :start_time, :cost, :contact_info
end
