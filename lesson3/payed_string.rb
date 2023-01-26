# frozen_string_literal: true

require 'pry'

# 1 - 10 буквы 1 очко
# 11 - 20 буквы 2 очка
# 21 - 30 буквы 3 очка
# 31 - 33 буквы 4 очка

hash = { 'а' => 4, 'я' => 8, 'д' => 2 }

puts 'Введите строку, чтобы узнать сколько будет стоить её отправить собеседнику'

string = gets.strip

money_to_pay = 0

string.each_char do |chr|
  money_to_pay += hash[chr] || 1
end

p "Стоймость строки: #{money_to_pay}"
