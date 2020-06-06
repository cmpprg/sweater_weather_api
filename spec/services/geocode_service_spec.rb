require 'rails_helper'

RSpec.describe GeocodeService do
  VCR.use_cassette('geocode', record: :new_episodes) do
    it "exists" do
      city = 'denver'
      state = 'co'
      service = GeocodeService.new(city, state)

      expect(service).to be_instance_of GeocodeService
    end

    it "can serve up a latitude and longitude for a city" do
      city = 'denver'
      state = 'co'
      service = GeocodeService.new(city, state)

      expect(service.lat_long).to eql({lat: 39.7392358,
                                       lng: -104.990251})
    end
  end
end
