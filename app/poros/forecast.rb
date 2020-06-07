class Forecast
  def initialize(location)
    @city = location[:city]
    @state = location[:state]
    @city_info = "#{@city}, #{@state}"
    @current_weather = CurrentWeather.new(@weather)
    @hourly_weather = HourlyWeather.new(@weather)
    @daily_weather = DailyWeather.new(@weather)
    @weather ||= weather_info
  end

  def weather_info
    
  end
end
