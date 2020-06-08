class Api::V1::FoodiesController < ApplicationController
  def show

    direction_info
    direction_response = Faraday.get("https://maps.googleapis.com/maps/api/directions/json?origin=denver,co&destination=pueblo,co&key=#{ENV['GOOGLE_KEY']}")
    hashed_response = JSON.parse(direction_response.body, symbolize_names: true)
    require 'pry'; binding.pry

    google_info
  end
end
