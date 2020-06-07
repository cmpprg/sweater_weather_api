class WeatherHour
  def initialize(hourly_info)
    @hour_time = hour_formatted(hourly_info[:dt])
    @icon = icon_url(hourly_info[:weather].first[:icon])
    @temp = hourly_info[:temp]
  end

  private

  def icon_url(icon_code)
    "http://openweathermap.org/img/wn/#{icon_code}@2x.png"
  end

  def hour_formatted(unix_time)
    Convertable.unix_to_hour_formatted(unix_time)
  end

end
