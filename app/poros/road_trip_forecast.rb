class RoadTripForecast
  def initialize(weather_info)
    @temperature = weather_info[:temp]
    @summary = weather_info[:weather].first[:description]
  end
end
