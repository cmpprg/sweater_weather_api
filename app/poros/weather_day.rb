class WeatherDay
  def initialize(daily_info)
    @day_of_week = day_of_week(daily_info[:dt])
    @icon = icon_url(daily_info[:weather].first[:icon])
    @description_short = daily_info[:weather].first[:main]
    @rain = amount_of_rain(daily_info[:rain])
    @high_temp = daily_info[:temp][:max]
    @low_temp = daily_info[:temp][:min]
  end

  private

  def day_of_week(unix_time)
    Convertable.unix_to_day_of_week(unix_time)
  end

  def icon_url(icon_code)
    "http://openweathermap.org/img/wn/#{icon_code}@2x.png"
  end

  def amount_of_rain(rain)
    return 0 if rain.nil?
    rain
  end
end
