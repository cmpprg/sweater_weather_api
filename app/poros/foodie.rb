class Foodie
  attr_reader :end_location,
              :travel_time,
              :forecast,
              :restaurant


  def initialize(foodie_info)
    @trip ||= GoogleDirectionService.new.trip_info_for(foodie_info[:start], foodie_info[:end])
    @end_location = foodie_info[:end]
    @travel_time = @trip[:routes].first[:legs].first[:duration][:text]
    @forecast = weather_data

    @restaurant = nil
  end

  private

  def lat
    @trip[:routes].first[:legs].first[:end_location][:lat]
  end

  def long
    @trip[:routes].first[:legs].first[:end_location][:lng]
  end

  def weather_service
    OpenWeatherService.new
  end

  def current_weather_data
    x = weather_service.weather_data(lat, long)[:current]
    require 'pry'; binding.pry
  end
end
