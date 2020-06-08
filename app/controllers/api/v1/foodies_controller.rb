class Api::V1::FoodiesController < ApplicationController
  def show
    
    foodie = Foodie.new(foodie_params)
    render json: FoodieSerializer.new(foodie)
  end

  private

  def foodie_params
    params.permit(:start, :end, :search)
  end
end
