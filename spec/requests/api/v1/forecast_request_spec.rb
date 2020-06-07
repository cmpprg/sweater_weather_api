require 'rails_helper'

RSpec.describe 'Forecast API' do
  it "can return forecast for a city" do
    VCR.use_cassette('weather_req', record: :new_episodes) do
      params = { location: 'daytona beach, fl' }
      get '/api/v1/forecast', params: params

      expect(response).to be_successful

      json = hash_json(response.body)

      require 'pry'; binding.pry
    end
  end
end
