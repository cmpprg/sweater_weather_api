class Api::V1::BackgroundsController < ApplicationController
  def show
    background = BackgroundImage.new(format_location)
    render json: BackgroundImageSerializer.new(background)
  end
end
