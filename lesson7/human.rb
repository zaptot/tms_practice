require 'pry'

module Runnable
  def run
    puts 'я запустился'
  end

  def stop
    puts 'я остановился'
  end
end

class Human
  attr_reader :name, :surname, :education

  def initialize(name, surname, education)
    @name = name
    @surname = surname
    @education = education
  end

  def say_name
    puts 'name'
  end

  def introduce
    puts "Привет, меня зовут #{name} #{surname} и я по образованию #{education}!"
  end

  def jump
    puts 'woooohoooo'
  end
end

class Programmer < Human
  def work
    puts 'Программирую программы'
  end
end

class Seller < Human
  def work
    puts 'Продаю продукты'
  end
end


binding.pry
Programmer.new('Vlad', 'Demyanovich', 'seller')
Seller.new('Vasya', 'Demyanovich', 'seller')
Human.new('Kolya', 'Demyanovich', 'driver')
