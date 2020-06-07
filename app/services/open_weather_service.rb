class OpenWeatherService
  def weather_data(latitude, longitude)
    hashed_json(onecall_response(latitude, longitude))
  end

  private

  def base_url
    'https://api.openweathermap.org/data/2.5'
  end

  def connect
    Faraday.new(base_url) do |req|
      req.params['exclude'] = 'minutely'
      req.params['appid'] = ENV['OPEN_WEATHER_KEY']
      req.params['units'] = 'imperial'
    end
  end

  def onecall_response(latitude, longitude)
    connect.get('onecall') do |req|
      req.params['lat'] = latitude
      req.params['lon'] = longitude
    end
  end

  def hashed_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
