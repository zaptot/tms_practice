# 1. Создаем словарь с хотя бы несколькими словами
# 2. Просим пользователя ввести слово с клавиатуры, которое надо перевести
# 3. Выводим перевод

en_ru = {
  'apple' => 'яблоко',
  'car'   => 'машина',
  'dog'   => 'собака',
  'cat'   => 'кошка'
}

loop do
  puts 'Введите слово для перевода'
  users_word = gets.strip

  if en_ru[users_word].nil?
    puts 'Такого слова нет!'
    puts 'Хотите добавить это слово в словарь?(y/n)'
    next if gets.strip == 'n'

    puts 'Введите перевод слова:'
    en_ru[users_word] = gets.strip
    puts 'Слово добавлено!'
  else
    puts "Ваш перевод: #{en_ru[users_word]}"
  end
end