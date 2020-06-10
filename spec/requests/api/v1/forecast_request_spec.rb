require 'rails_helper'

RSpec.describe 'Forecast API' do
  it 'can return forecast for a city' do
    VCR.use_cassette('weather_req') do
      params = { location: 'daytona beach,fl' }
      get '/api/v1/forecast', params: params

      expect(response).to be_successful

      json = hash_json(response.body)

      expect(json[:data]).to have_key(:id)
      expect(json[:data]).to have_key(:type)
      expect(json[:data]).to have_key(:attributes)

      expect(json[:data][:attributes]).to have_key(:city_info)
      expect(json[:data][:attributes]).to have_key(:current_weather)

      current_weather_keys = [
        :description, :icon, :current_temp, :high_temp, :low_temp,
        :current_time_date, :sunrise_time, :sunset_time, :feels_like, :humidity,
        :visibility_mile, :uv_index
      ]
      current_weather = json[:data][:attributes][:current_weather]

      current_weather_keys.each do |key|
        expect(current_weather).to have_key(key)
      end

      current_weather_keys.each do |key|
        expect(current_weather[key]).to_not be_nil
      end

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
