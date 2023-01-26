require 'curb'
require 'pry'
require 'json'

module BodyToJson
  def body
    puts 'я поменял метод'
    JSON(super)
  end
end

Curl::Easy.prepend BodyToJson


def get_data
  c = Curl::Easy.new("https://jsonplaceholder.typicode.com/todos/1")
  c.perform
  c.body
rescue PerformError
  retry
rescue BodyError
  puts 'Bad body'
end