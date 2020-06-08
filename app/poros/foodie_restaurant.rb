class FoodieRestaurant
  def initialize(restaurant_info)
    @name = restaurant_info[:restaurants].first[:restaurant][:name]
    @address = restaurant_info[:restaurants].first[:restaurant][:location][:address]
  end
end
