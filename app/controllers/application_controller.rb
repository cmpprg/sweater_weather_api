class ApplicationController < ActionController::API

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
