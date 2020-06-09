class OpenWeatherService
  def weather_data(latitude, longitude)
    hashed_json(onecall_response(latitude, longitude))
  end

  def hourly_weather_data(latitude, longitude)
    hashed_json(hourly_onecall_response(latitude, longitude))
  end

  private

  def base_url
    'https://api.openweathermap.org/data/2.5'
  end

  def connect
    Faraday.new(base_url) do |req|
      req.params['appid'] = ENV['OPEN_WEATHER_KEY']
      req.params['units'] = 'imperial'
    end
  end

  def onecall_response(latitude, longitude)
    connect.get('onecall') do |req|
      req.params['lat'] = latitude
      req.params['lon'] = longitude
      req.params['exclude'] = 'minutely'
    end
  end

  def hourly_onecall_response(latitude, longitude)
    connect.get('onecall') do |req|
      req.params['lat'] = latitude
      req.params['lon'] = longitude
      req.params['exclude'] = 'current,minutely,daily'
    end
  end

  def hashed_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
