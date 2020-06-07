class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  set_id { |id| id = 'weather' }
  attributes :city_info,
             :current_weather,
             :hourly_weather,
             :daily_weather
end
