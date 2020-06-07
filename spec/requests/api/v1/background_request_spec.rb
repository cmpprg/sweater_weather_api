require 'rails_helper'

RSpec.describe 'backgrounds API' do
  VCR.use_cassette('background_req') do
    it "can return a background url for a location" do
      get "/api/v1/backgrounds?location=denver,co"

      expect(response).to be_successful

      json = hash_json(response.body)

      expect(json[:data]).to have_key(:id)
      expect(json[:data]).to have_key(:type)
      expect(json[:data]).to have_key(:attributes)

      expect(json[:data][:attributes]).to have_key(:city)
      expect(json[:data][:attributes]).to have_key(:state)
      expect(json[:data][:attributes]).to have_key(:url)

      expect(json[:data][:attributes][:city]).to_not be_nil
      expect(json[:data][:attributes][:state]).to_not be_nil
      expect(json[:data][:attributes][:url]).to_not be_nil
    end
  end
end
