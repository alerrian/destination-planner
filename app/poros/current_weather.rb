class CurrentWeather
  attr_reader :date,
              :summary

  def initialize(weather_info)
    @date = Time.now.strftime("%A %B %e")
    @summary = weather_info[:weather].first[:description]
    @weather_info = weather_info
  end

  def temp_high
    @weather_info[:main][:temp_max].to_f * (9/5) - 459.67
  end

  def temp_low
    @weather_info[:main][:temp_min].to_f * (9/5) - 459.67
  end
end
