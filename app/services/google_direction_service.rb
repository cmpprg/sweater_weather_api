class GoogleDirectionService
  def trip_info_for(origin, destination)
    direction_response = Faraday.get("https://maps.googleapis.com/maps/api/directions/json?origin=denver,co&destination=pueblo,co&key=#{ENV['GOOGLE_KEY']}")
    JSON.parse(direction_response.body, symbolize_names: true)
  end
end
