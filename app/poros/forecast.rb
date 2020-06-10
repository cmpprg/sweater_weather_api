class Forecast
  attr_reader :city_info,
              :current_weather,
              :hourly_weather,
              :daily_weather


  def initialize(location)
    @city_state = location
    @weather = weather_info
    @city_info = Convertable.format_city_state(location)
    @current_weather = CurrentWeather.new(@weather)
    @hourly_weather = HourlyWeather.new(@weather[:hourly])
    @daily_weather = DailyWeather.new(@weather[:daily])
  end

  private

  def weather_info
    @weather_data ||= weather_service.weather_data(geo_location.latitude, geo_location.longitude)
  end

  def geo_location
    @location ||= Location.new(google_service.geocode_info_for(@city_state))
  end

  def google_service
    GoogleService.new
  end

  def weather_service
    OpenWeatherService.new
  end
end
