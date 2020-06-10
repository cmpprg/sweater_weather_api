class HourlyWeather
  def initialize(weather_info)
    @hours = collection_of_8_weather_hours(weather_info)
  end

  private

  def collection_of_8_weather_hours(info)
    info[0..7].map { |hour| WeatherHour.new(hour) }
  end
end
