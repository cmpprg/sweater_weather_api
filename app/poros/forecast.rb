class Forecast
  attr_reader :city_info,
              :current_weather,
              :hourly_weather,
              :daily_weather


  def initialize(location)
    @city = location[:city]
    @state = location[:state]
    @city_info = "#{@city.capitalize}, #{@state.upcase}"
    @current_weather = CurrentWeather.new(@weather)
    @hourly_weather = HourlyWeather.new(@weather)
    @daily_weather = DailyWeather.new(@weather)
    @weather ||= weather_info
  end

  private

  def weather_info
    weather_service = OpenWeatherService.new
    weather_service.weather_data(geo_location.latitude, geo_location.longitude)
  end

  def geo_location
    geocode_service = GeocodeService.new
    Location.new(geocode_service.info_for(@city, @state))
  end
end
