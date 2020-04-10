class WeatherSearch
  def initialize(zip)
    @zip = zip
  end

  def get_weather
    weather_service = WeatherService.new
    response = weather_service.get_weather_by(@zip)
    CurrentWeather.new(response)
  end
end
