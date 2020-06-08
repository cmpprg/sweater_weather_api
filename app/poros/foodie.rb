class Foodie
  attr_reader :end_location,
              :travel_time,
              :forecast,
              :restaurant


  def initialize(foodie_info)
    @trip ||= GoogleDirectionService.new.trip_info_for(foodie_info[:start], foodie_info[:end])
    @end_location = foodie_info[:end]
    @travel_time = @trip[:routes].first[:legs].first[:duration][:text]
    @forecast = nil
    @restaurant = nil
  end


end
