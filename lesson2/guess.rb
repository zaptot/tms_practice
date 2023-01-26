# +1. компьютер загадывает число
# 2. просим пользователя угадать число (рассказать пользователю про правила игры)
# 3. проверяем угадал ли и чуть что подсказываем
# 4. обновляем количество попыток




MIN = 0
MAX = 100
MAX_TRIES = 7

# loop do
#   secret_number = rand(MIN..MAX)
#   puts 'Добро пожаловать в игру угадай число!'
#   users_try_count = 1

#   loop do
#     puts "У вас есть #{MAX_TRIES - users_try_count + 1} попыток угадать число от #{MIN} до #{MAX}"
#     puts 'Угадайте число:'
#     users_guess = gets.to_i

#     if users_guess == secret_number
#       puts 'Вы выиграли!'
#       break
#     elsif users_try_count >= MAX_TRIES
#       puts "Вы проиграли, загаданное число было: #{secret_number}"
#       break
#     elsif users_guess < secret_number
#       puts 'Ваше число меньше загаданного!'
#       users_try_count += 1
#     elsif users_guess > secret_number
#       puts 'Ваше число больше загаданного!'
#       users_try_count += 1
#     end
#   end
# end