class Foodie
  attr_reader :end_location,
              :travel_time,
              :forecast,
              :restaurant


  def initialize(foodie_info)
    @trip ||= GoogleDirectionService.new.trip_info_for(foodie_info[:start], foodie_info[:end])
    @cuisine = foodie_info[:search]
    @end_location = foodie_info[:end]
    @travel_time = @trip[:routes].first[:legs].first[:duration][:text]
    @forecast = FoodieForecast.new(destination_current_weather_data)
    @restaurant = FoodieRestaurant.new(restaurant_search)
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
    @weather ||= OpenWeatherService.new
  end

  def restaurant_search
    zomato_service.restaurant_search(city_id, @cuisine)
  end
  
  def city_id
    zomato_service.city_id_search(destination_lat, destination_long)
  end


  def zomato_service
    @zomato ||= ZomatoService.new
  end

end
