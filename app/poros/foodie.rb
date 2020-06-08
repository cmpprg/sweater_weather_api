class Foodie
  attr_reader :end_location,
              :travel_time,
              :forecast,
              :restaurant


  def initialize(foodie_info)
    @trip ||= GoogleDirectionService.new.trip_info_for(foodie_info[:start], foodie_info[:end])
    @end_location = foodie_info[:end]
    @travel_time = @trip[:routes].first[:legs].first[:duration][:text]
    @forecast = FoodieForecast.new(destination_current_weather_data)
    @restaurant = nil
  end

  private

  def destination_lat
    @trip[:routes].first[:legs].first[:end_location][:lat]
  end

  def destination_long
    @trip[:routes].first[:legs].first[:end_location][:lng]
  end

  def destination_current_weather_data
    weather_service.weather_data(destination_lat, destination_long)[:current]
  end

  def weather_service
    OpenWeatherService.new
  end

end
