class WeatherService
  def get_weather_by(zip)
    response = conn.get('/data/2.5/weather') do |f|
      f.params['zip'] = zip
      f.params['appid'] = ENV['OWM_KEY']
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new(url: 'https://api.openweathermap.org')
  end
end
