class ZomatoService
  def city_id_search(lat, long)
    response = Faraday.get("https://developers.zomato.com/api/v2.1/geocode?lat=#{lat}&lon=#{long}") do |req|
      req.headers['user-key'] = ENV['ZOMATO_KEY']
    end

    JSON.parse(response.body, symbolize_names: true)[:location][:city_id]
  end

  def restaurant_search(city_id, cuisine)
    response = Faraday.get("https://developers.zomato.com/api/v2.1/search?entity_id=#{city_id}&entity_type=city&q=#{cuisine}&count=1") do |req|
      req.headers['user-key'] = ENV['ZOMATO_KEY']
    end

    JSON.parse(response.body, symbolize_names: true)
  end
end
