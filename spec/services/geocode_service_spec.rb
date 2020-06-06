require 'rails_helper'

RSpec.describe GeocodeService do
  it "exists" do
    city = 'denver'
    state = 'co'
    service = GeocodeService.new(city, state)

    expect(service).to be_instance_of GeocodeService
  end
end
