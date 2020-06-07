class OpenWeatherService
  def weather_data(latitude, longitude)
    response = Faraday.get('https://api.openweathermap.org/data/2.5/onecall') do |req|
      req.params['lat'] = latitude
      req.params['lon'] = longitude
      req.params['exclude'] = 'minutely'
      req.params['appid'] = ENV['OPEN_WEATHER_KEY']
      req.params['units'] = 'imperial'
    end

    JSON.parse(response.body, symbolize_names: true)
  end
end
