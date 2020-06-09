class RoadTrip
  include Convertable
  attr_reader :origin,
              :destination,
              :travel_time,
              :arrival_forecast

  def initialize(road_trip_info)
    @origin = format_city_state(road_trip_info[:origin])
    @destination = format_city_state(road_trip_info[:destination])
    @travel_time = rounded_travel_time
    @arrival_forecast = RoadTripForecast.new()
  end

  private

  def format_city_state(city_state)
    city_state.sub(',', ', ')
  end

  def rounded_travel_time
    seconds = directions_info[:routes].first[:legs].first[:duration][:value]
    Convertable.seconds_to_rounded_hour(seconds)
  end

  def directions_info
    @info ||= google_service.directions_info_for(@origin, @destination)
  end

  def google_service
    GoogleService.new
  end
end
