class Api::V1::ForecastsController < ApplicationController
  def show
    forecast = Forecast.new(format_location)
    render json: ForecastSerializer.new(forecast)
  end
end
