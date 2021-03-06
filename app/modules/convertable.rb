module Convertable
  def self.meter_to_mile(meters)
    meters * 0.00062137
  end

  def self.unix_to_time_date_formatted(unix_time)
    Time.at(unix_time).strftime('%-l:%M %p, %B %-d')
  end

  def self.unix_to_hour_min_formatted(unix_time)
    Time.at(unix_time).strftime('%-l:%M %p')
  end

  def self.unix_to_hour_formatted(unix_time)
    Time.at(unix_time).strftime('%-l %p')
  end

  def self.unix_to_day_of_week(unix_time)
    Time.at(unix_time).strftime('%A')
  end

  def self.seconds_to_rounded_hour(seconds)
    (seconds / 3600.0).round
  end

  def self.format_city_state(city_state)
    city_state.sub(',', ', ')
  end
end
