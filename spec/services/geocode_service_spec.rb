require 'rails_helper'

RSpec.describe GeocodeService do
  it "exists" do
    service = GeocodeService.new

    expect(service).to be_instance_of GeocodeService
  end

  it "can serve up a latitude and longitude for a city" do
    VCR.use_cassette('geocode', record: :new_episodes) do
      city = 'denver'
      state = 'co'
      service = GeocodeService.new
      lat_long = service.info_for(city, state)

      expect(lat_long).to have_key(:results)
      expect(lat_long[:results].first[:address_components].first[:long_name]).to eql(city.capitalize)
      expect(lat_long[:results].first[:address_components][2][:short_name]).to eql(state.upcase)
      expect(lat_long[:results].first[:geometry][:location][:lat]).to eql(39.7392358)
      expect(lat_long[:results].first[:geometry][:location][:lng]).to eql(-104.990251)
    end
  end
end
