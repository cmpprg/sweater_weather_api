class CurrentWeather
  include Convertable

  def initialize(weather_info)
    @description = weather_info[:current][:weather].first[:description]
    @icon = icon_url(weather_info[:current][:weather].first[:icon])
    @current_temp = weather_info[:current][:temp]
    @high_temp = weather_info[:daily].first[:temp][:max]
    @low_temp = weather_info[:daily].first[:temp][:min]
    @feels_like = weather_info[:current][:feels_like]
    @humidity = weather_info[:current][:humidity]
    @uv_index = weather_info[:current][:uvi]
    @visibility_mile = visibility_in_miles(weather_info)
    @sunset_time = hour_minute_formatted(weather_info[:current][:sunset])
    @sunrise_time = hour_minute_formatted(weather_info[:current][:sunrise])
    @current_time_date = time_date_formatted(weather_info)
  end

  def visibility_in_miles(weather_info)
    Convertable.meter_to_mile(weather_info[:current][:visibility])
  end

  def time_date_formatted(weather_info)
    Convertable.unix_to_time_date_formatted(weather_info[:current][:dt])
  end

  def hour_minute_formatted(unix_time)
    Convertable.unix_to_hour_min_formatted(unix_time)
  end

  def icon_url(icon_code)
    "http://openweathermap.org/img/wn/#{icon_code}@2x.png"
  end
end
