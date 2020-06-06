class GeocodeService
  def lat_long(city, state)
    response = Faraday.get("https://maps.googleapis.com/maps/api/geocode/json") do |req|
      req.params['address'] = "#{city}, #{state}"
      req.params['key'] = ENV['GEOCODE_KEY']
    end

    hashed_json = JSON.parse(response.body, symbolize_names: true)

    
  end

  private
end
