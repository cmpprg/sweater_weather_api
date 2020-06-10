class RoadTrip
  include Convertable
  attr_reader :origin,
              :destination,
              :travel_time,
              :arrival_forecast

  def initialize(road_trip_info)
    @origin = Convertable.format_city_state(road_trip_info[:origin])
    @destination = Convertable.format_city_state(road_trip_info[:destination])
    @travel_time = rounded_hour_travel_time
    @arrival_forecast = RoadTripForecast.new(arrival_weather_data)
  end

  private

  def rounded_hour_travel_time
    Convertable.seconds_to_rounded_hour(travel_time_seconds)
  end

  def travel_time_seconds
    directions_info[:routes].first[:legs].first[:duration][:value]
  end

  def directions_info
    @travel_info ||= google_service.directions_info_for(@origin, @destination)
  end

  def minute_of_hour_arrival_time
    Time.at(Time.now.to_i + travel_time_seconds).min
  end

  def minute_less_than_30?
    minute_of_hour_arrival_time < 30
  end

  def arrival_weather_data
    return dest_weather_data[:hourly][@travel_time] if minute_less_than_30?
    dest_weather_data[:hourly][@travel_time + 1]
  end

  def dest_weather_data
    @weather_data ||= weather_service.hourly_weather_data(dest_lat, dest_long)
  end

  def dest_lat
    Location.new(geo_location_data).latitude
  end

  def dest_long
    Location.new(geo_location_data).longitude
  end

  def geo_location_data
    @geocode_info ||= google_service.geocode_info_for(@destination)
  end

  def google_service
    GoogleService.new
  end

  def weather_service
    OpenWeatherService.new
  end
end
