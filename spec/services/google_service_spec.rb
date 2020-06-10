require 'rails_helper'

RSpec.describe GoogleService do
  it "exists" do
    service = GoogleService.new

    expect(service).to be_instance_of GoogleService
  end

  it "can return a latitude and longitude for a city" do
    VCR.use_cassette('geocode', record: :new_episodes) do
      location = 'denver,co'
      service = GoogleService.new
      lat_long = service.geocode_info_for(location)

      expect(lat_long).to have_key(:results)
      expect(lat_long[:results].first[:geometry][:location][:lat]).to eql(39.7392358)
      expect(lat_long[:results].first[:geometry][:location][:lng]).to eql(-104.990251)
    end
  end

  it "can return travel info from an origin and destination" do
    VCR.use_cassette('directions') do
      origin = 'Denver,CO'
      destination = 'Pueblo,CO'
      service = GoogleService.new
      directions = service.directions_info_for(origin, destination)

      expect(directions).to have_key(:routes)
      expect(directions[:routes].first).to have_key(:legs)
      expect(directions[:routes].first[:legs].first).to have_key(:duration)
      expect(directions[:routes].first[:legs].first[:duration]).to have_key(:text)
    end
  end
end
