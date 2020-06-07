require "rails_helper"

RSpec.describe UnsplashService do
  it "exists" do
    service = UnsplashService.new

    expect(service).to be_instance_of UnsplashService
  end
end
