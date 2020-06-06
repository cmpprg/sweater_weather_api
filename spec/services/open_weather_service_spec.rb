require 'rails_helper'

RSpec.describe OpenWeatherService do
  it "exists" do
    service = OpenWeatherService.new

    expect(service).to be_instance_of OpenWeatherService
  end
end
