class Api::V1::RoadTripsController < ApplicationController
  def create
    road_trip = RoadTrip.new(road_trip_params)
    render json: RoadTripSerializer.new(road_trip)
  end

  private

  def road_trip_params
    params.permit(:origin, :destination)
  end
end
