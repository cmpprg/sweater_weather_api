class DailyWeather
  def initialize(weather_info)
    @days = collection_of_weather_days(weather_info)
  end

  private

  def collection_of_weather_days(info)
    info[1..5].map { |day| WeatherDay.new(day) }
  end
end
