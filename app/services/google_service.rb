class GoogleService
  def geocode_info_for(location)
    hashed_json(geocode_response(location))
  end

  def directions_info_for(origin, destination)
    hashed_json(directions_response(origin, destination))
  end

  private

  def base_url
    'https://maps.googleapis.com/maps/api'
  end

  def connect
    Faraday.new(base_url) do |req|
      req.params['key'] = ENV['GOOGLE_KEY']
    end
  end

  def geocode_response(location)
    connect.get('geocode/json') do |req|
      req.params['address'] = location
    end
  end

  def directions_response(origin, destination)
    connect.get('directions/json') do |req|
      req.params['origin'] = origin
      req.params['destination'] = destination
    end
  end

  def hashed_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
