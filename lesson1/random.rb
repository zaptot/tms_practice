# 0+. Создать цикл, в котором будем генерировать значения
# 1+. Ввести с клавиатуры границы для генерации случайного числа
# 2. Проверить, что границы валидны
# 3. Генерация и вывод результата


# rand(min..max) - возвращает число от min до max
# gets - разрешает вводить пользователю данные с клавиатуры
# string.to_i - приводит строку к целому числу
# puts - вывод текста пользователю
# next - переход к следующей итерации цикла
# "#{}" - #{} это вставка данных из переменной в строку (конкатенация строк)

while true
  puts 'Введите нижнюю границу:'
  min = gets.to_i
  puts 'Введите верхнюю границу:'
  max = gets.to_i

  if min > max
    puts 'Границы неверные!'
    next
  end

  random_number = rand(min..max)
  puts "Ваше число: #{random_number}"
end