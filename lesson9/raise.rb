require 'pry'

# написать retry на количество повторений
# rescue
# retry

NUMBER_OF_RETRIES = 5

def do_smthing_with_retry
  counter = 0
  begin
    puts 'Hello'
    raise StandardError, 'my error'
  rescue StandardError
    counter += 1
    retry if counter < NUMBER_OF_RETRIES
  ensure
    puts 'выхожу из метода'
  end
end

do_smthing_with_retry