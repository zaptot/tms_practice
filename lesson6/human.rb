require 'pry'

class Human
  LOVE_TO_CATS = true

  attr_reader :age
  attr_accessor :name

  def initialize(sex, age, name)
    @sex  = sex
    @age  = age
    @name = name
  end

  def introduce
    puts "Привет моё имя #{name}, мне #{age} лет, я #{sex} пола"
  end

  private

  attr_reader :sex
end

vasya = Human.new('male', 25, 'Vasya')
binding.pry

puts '123'