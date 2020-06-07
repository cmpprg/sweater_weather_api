class Location
  attr_reader :latitude, :longitude
  
  def initialize(geocode_info)
    @latitude = geocode_info[:results].first[:geometry][:location][:lat]
    @longitude = geocode_info[:results].first[:geometry][:location][:lng]
  end
end
