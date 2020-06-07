require 'rails_helper'

RSpec.describe 'Forecast API' do
  it "can return forecast for a city" do
    VCR.use_cassette('weather_req', record: :new_episodes) do
      params = { location: 'daytona beach, fl' }
      get '/api/v1/forecast', params: params

      expect(response).to be_successful

      json = hash_json(response.body)

      expect(json[:data]).to have_key(:id)
      expect(json[:data]).to have_key(:type)
      expect(json[:data]).to have_key(:attributes)

      expect(json[:data][:attributes]).to have_key(:city_info)

      expect(json[:data][:attributes]).to have_key(:current_weather)
      expect(json[:data][:attributes][:current_weather]).to have_key(:description)
      expect(json[:data][:attributes][:current_weather]).to have_key(:icon)
      expect(json[:data][:attributes][:current_weather]).to have_key(:current_temp)
      expect(json[:data][:attributes][:current_weather]).to have_key(:high_temp)
      expect(json[:data][:attributes][:current_weather]).to have_key(:low_temp)
      expect(json[:data][:attributes][:current_weather]).to have_key(:current_time_date)
      expect(json[:data][:attributes][:current_weather]).to have_key(:sunrise_time)
      expect(json[:data][:attributes][:current_weather]).to have_key(:sunset_time)
      expect(json[:data][:attributes][:current_weather]).to have_key(:feels_like)
      expect(json[:data][:attributes][:current_weather]).to have_key(:humidity)
      expect(json[:data][:attributes][:current_weather]).to have_key(:visibility_mile)
      expect(json[:data][:attributes][:current_weather]).to have_key(:uv_index)

      expect(json[:data][:attributes][:current_weather][:description]).to_not be_nil
      expect(json[:data][:attributes][:current_weather][:icon]).to_not be_nil
      expect(json[:data][:attributes][:current_weather][:current_temp]).to_not be_nil
      expect(json[:data][:attributes][:current_weather][:high_temp]).to_not be_nil
      expect(json[:data][:attributes][:current_weather][:low_temp]).to_not be_nil
      expect(json[:data][:attributes][:current_weather][:current_time_date]).to_not be_nil
      expect(json[:data][:attributes][:current_weather][:sunrise_time]).to_not be_nil
      expect(json[:data][:attributes][:current_weather][:sunset_time]).to_not be_nil
      expect(json[:data][:attributes][:current_weather][:feels_like]).to_not be_nil
      expect(json[:data][:attributes][:current_weather][:humidity]).to_not be_nil
      expect(json[:data][:attributes][:current_weather][:visibility_mile]).to_not be_nil
      expect(json[:data][:attributes][:current_weather][:uv_index]).to_not be_nil

      expect(json[:data][:attributes]).to have_key(:hourly_weather)
      expect(json[:data][:attributes][:hourly_weather]).to have_key(:hours)
      expect(json[:data][:attributes][:hourly_weather][:hours]).to be_instance_of(Array)
      expect(json[:data][:attributes][:hourly_weather][:hours].length).to eql(8)
      expect(json[:data][:attributes][:hourly_weather][:hours].first).to have_key(:hour_time)
      expect(json[:data][:attributes][:hourly_weather][:hours].first).to have_key(:icon)
      expect(json[:data][:attributes][:hourly_weather][:hours].first).to have_key(:temp)

      expect(json[:data][:attributes][:hourly_weather][:hours].first[:hour_time]).to_not be_nil
      expect(json[:data][:attributes][:hourly_weather][:hours].first[:icon]).to_not be_nil
      expect(json[:data][:attributes][:hourly_weather][:hours].first[:temp]).to_not be_nil

      expect(json[:data][:attributes]).to have_key(:daily_weather)
      expect(json[:data][:attributes][:daily_weather][:days]).to be_instance_of Array
      expect(json[:data][:attributes][:daily_weather][:days].length).to eql(5)
      expect(json[:data][:attributes][:daily_weather][:days].first).to have_key(:day_of_week)
      expect(json[:data][:attributes][:daily_weather][:days].first).to have_key(:icon)
      expect(json[:data][:attributes][:daily_weather][:days].first).to have_key(:description_short)
      expect(json[:data][:attributes][:daily_weather][:days].first).to have_key(:rain)
      expect(json[:data][:attributes][:daily_weather][:days].first).to have_key(:high_temp)
      expect(json[:data][:attributes][:daily_weather][:days].first).to have_key(:low_temp)

      expect(json[:data][:attributes][:daily_weather][:days].first[:day_of_week]).to_not be_nil
      expect(json[:data][:attributes][:daily_weather][:days].first[:icon]).to_not be_nil
      expect(json[:data][:attributes][:daily_weather][:days].first[:description_short]).to_not be_nil
      expect(json[:data][:attributes][:daily_weather][:days].first[:rain]).to_not be_nil
      expect(json[:data][:attributes][:daily_weather][:days].first[:high_temp]).to_not be_nil
      expect(json[:data][:attributes][:daily_weather][:days].first[:low_temp]).to_not be_nil
    end
  end
end
