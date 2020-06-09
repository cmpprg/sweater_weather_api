class Api::V1::RoadTripsController < ApplicationController
  def create
    if User.find_by(api_key: params[:api_key])
      road_trip = RoadTrip.new(road_trip_params)
      render json: RoadTripSerializer.new(road_trip)
    else
      error = Error.new(api_key_error)
      render json: ErrorSerializer.new(error), status: :unauthorized
    end
  end

  private

  def road_trip_params
    params.permit(:origin, :destination)
  end

  def api_key_error
    'The API-Key you used is invalid'
  end
end
