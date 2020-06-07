class Api::V1::ForecastsController < ApplicationController
  def show
    forecast = Forecast.new(format_location)
    render json: ForecastSerializer.new(forecast)
  end

  private

  def format_location
    {
      city: split_location_params.first,
      state: split_location_params.last
    }
  end

  def split_location_params
    params[:location].split(',')
  end
end
