require 'rails_helper'

RSpec.describe 'Road Trip API endpoint' do
  before(:each) do
    @headers = { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    @user = create_user('user@email.com', 'password')
  end

  it "can take origin, destination, and api-key and return trip info json" do
    road_trip_params = {
      origin: 'Denver,CO',
      destination: 'Pueblo,CO',
      api_key: 'jgn983hy48thw9begh98h4539h4'
    }

    post '/api/v1/road_trip', params: road_trip_params.to_json, headers: @headers

    expect(response).to be_successful

    json = hash_json(response.body)

    expect(json[:data]).to have_key(:id)
    expect(json[:data]).to have_key(:type)
    expect(json[:data]).to have_key(:attributes)

    expect(json[:data][:attributes]).to have_key(:origin)
    expect(json[:data][:attributes]).to have_key(:destination)
    expect(json[:data][:attributes]).to have_key(:travel_time)
    expect(json[:data][:attributes]).to have_key(:arrival_forecast)

    expect(json[:data][:attributes][:arrival_forecast]).to have_key(:temperature)
    expect(json[:data][:attributes][:arrival_forecast]).to have_key(:summary)

    expect(json[:data][:attributes][:origin]).to_not be_nil
    expect(json[:data][:attributes][:destination]).to_not be_nil
    expect(json[:data][:attributes][:travel_time]).to_not be_nil

    expect(json[:data][:attributes][:arrival_forecast][:temperature]).to_not be_nil
    expect(json[:data][:attributes][:arrival_forecast][:summary]).to_not be_nil
  end
end