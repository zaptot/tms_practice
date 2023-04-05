require 'curb'
require 'json'
require 'pry'

# https://api.open-meteo.com/v1/forecast?latitude=25.08&longitude=55.31&current_weather=true

# +1. найти апи, по которому мы будет получать погоду
# +2. написать класс, который сможет получать погоду по широте + долготе
# +3. попросить пользователя ввести широту и долготу, по которой он хочешь получить погоду
# +4. нужно выполнить запрос
# +5. отобразить данные пользователю
# *6. обрабатывать ошибки, которые может вернуть сервис

class WeatherDeterminer
  class BadWeatherRequest < StandardError; end

  HOST         = 'https://api.open-meteo.com'
  WEATHER_PATH = '/v1/forecast'

  class << self
    def call(latitude:, longitude:)
      request_params = params(latitude: latitude, longitude: longitude)
      request_url = Curl::urlalize(weather_url, request_params)

      response = make_request(url: request_url, params: request_params)
      "#{response['current_weather']['temperature']}°C"
    rescue BadWeatherRequest => e
      e.message
    end

    private

    def make_request(url:, params:)
      curl = Curl::Easy.new
      curl.url = Curl::urlalize(url, params)
      curl.perform
      result = JSON(curl.body)
      raise BadWeatherRequest, error_message(result) if curl.status >= '400'

      result
    end

    def params(latitude:, longitude:)
      {
        latitude: latitude, 
        longitude: longitude, 
        current_weather: true
      }
    end

    def weather_url
      File.join(HOST, WEATHER_PATH)
    end

    def error_message(response)
      response['reason'] || 'Unknown Error'
    end
  end
end

loop do
  puts 'Введите широта'
  latitude = gets.to_f
  puts 'Введите долготу'
  longitude = gets.to_f

  current_weather = WeatherDeterminer.call(latitude: latitude, longitude: longitude)
  puts "Ваш результат: #{current_weather}"
end