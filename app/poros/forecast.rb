class Forecast
  attr_reader :city_info,
              :current_weather,
              :hourly_weather,
              :daily_weather


  def initialize(location)
    @city = location[:city]
    @state = location[:state]
    @weather = weather_info
    @city_info = "#{@city}, #{@state}"
    @current_weather = CurrentWeather.new(@weather)
    @hourly_weather = HourlyWeather.new(@weather[:hourly])
    @daily_weather = DailyWeather.new(@weather[:daily])
  end

  private

  def weather_info
    @weather ||= weather_service.weather_data(geo_location.latitude, geo_location.longitude)
  end

  def geo_location
    @location ||= Location.new(geocode_service.info_for(@city, @state))
  end

  def geocode_service
    GeocodeService.new
  end

  def weather_service
    OpenWeatherService.new
  end
end
