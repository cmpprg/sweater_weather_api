class ZomatoService
  def city_id_search(lat, long)
    hashed_json(city_id_response(lat, long))[:location][:city_id]
  end

  def restaurant_search(city_id, cuisine)
    hashed_json(restaurant_response(city_id, cuisine))
  end

  private

  def base_url
    'https://developers.zomato.com/api/v2.1'
  end

  def connect
    Faraday.new(base_url) do |req|
      req.headers['user-key'] = ENV['ZOMATO_KEY']
    end
  end

  def city_id_response(lat, long)
    connect.get('geocode') do |req|
      req.params['lat'] = lat
      req.params['lon'] = long
    end
  end

  def restaurant_response(city_id, cuisine)
    connect.get('search') do |req|
      req.params['entity_id'] = city_id
      req.params['entity_type'] = 'city'
      req.params['q'] = cuisine
      req.params['count'] = '1'
    end
  end

  def hashed_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
