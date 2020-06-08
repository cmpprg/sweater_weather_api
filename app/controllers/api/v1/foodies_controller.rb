class Api::V1::FoodiesController < ApplicationController
  def show
    direction_info = GoogleDirectionService.new.trip_info_for(params[:start], params[:end])

    foodie = Foodie.new(foodie_params)
    render json: FoodieSerializer(foodie)
  end

  private

  def foodie_params
    params.permit(:start, :end, :search)
  end
end
