class RoadTrip
  attr_reader :origin,
              :destination,
              :travel_time,
              :arrival_forecast

  def initialize(road_trip_info)
    @origin = format_city_state(road_trip_info[:origin])
    @destination = format_city_state(road_trip_info[:destination])
    @travel_time = nil
    @arrival_forecast = RoadTripForecast.new()
  end

  private

  def format_city_state(city_state)
    city_state.sub(',', ', ')
  end
end
