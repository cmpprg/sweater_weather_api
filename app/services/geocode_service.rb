class GeocodeService
  def lat_long(city, state)
    hashed_json(response(city, state))
  end

  private

  def base_url
    'https://maps.googleapis.com/maps/api/geocode'
  end

  def connect
    Faraday.new(base_url) do |req|
      req.params['key'] = ENV['GEOCODE_KEY']
    end
  end

  def response(city, state)
    connect.get('json') do |req|
      req.params['address'] = "#{city}, #{state}"
    end
  end

  def hashed_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end


end
