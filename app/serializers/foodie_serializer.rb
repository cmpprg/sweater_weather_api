class FoodieSerializer
  include FastJsonapi::ObjectSerializer

  set_id { |id| id = nil }

  attributes :end_location,
             :travel_time,
             :forecast,
             :restaurant
end
