require "rails_helper"

RSpec.describe 'Foodie API' do
  it "can return forecast and restaurant from two cities and a food type" do
    VCR.use_cassette('foodie_request') do
      get '/api/v1/foodie?start=denver,co&end=pueblo,co&search=italian'

      expect(response).to be_successful

      json = hash_json(response.body)

      expect(json[:data]).to have_key(:id)
      expect(json[:data][:id]).to be_nil

      expect(json[:data]).to have_key(:type)
      expect(json[:data]).to have_key(:attributes)

      expect(json[:data][:attributes]).to have_key(:end_location)
      expect(json[:data][:attributes]).to have_key(:travel_time)
      expect(json[:data][:attributes][:end_location]).to_not be_nil
      expect(json[:data][:attributes][:travel_time]).to_not be_nil

      expect(json[:data][:attributes]).to have_key(:forecast)
      expect(json[:data][:attributes]).to have_key(:restaurant)

      expect(json[:data][:attributes][:forecast]).to have_key(:summary)
      expect(json[:data][:attributes][:forecast]).to have_key(:temperature)
      expect(json[:data][:attributes][:forecast][:summary]).to_not be_nil
      expect(json[:data][:attributes][:forecast][:temperature]).to_not be_nil
      
      expect(json[:data][:attributes][:restaurant]).to have_key(:name)
      expect(json[:data][:attributes][:restaurant]).to have_key(:address)
      expect(json[:data][:attributes][:restaurant][:name]).to_not be_nil
      expect(json[:data][:attributes][:restaurant][:address]).to_not be_nil
    end
  end
end
