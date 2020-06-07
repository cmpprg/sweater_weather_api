require "rails_helper"

RSpec.describe UnsplashService do
  it "exists" do
    service = UnsplashService.new

    expect(service).to be_instance_of UnsplashService
  end

  it "can return data on images based on location" do
    VCR.use_cassette("unsplash_service") do
      city = 'denver'
      state = 'co'
      service = UnsplashService.new
      background_image = service.image_url_for(city, state)

      expect(background_image).to have_key(:results)
      expect(background_image[:results].first).to have_key(:urls)
      expect(background_image[:results].first[:urls]).to have_key(:raw)
    end
  end
end
