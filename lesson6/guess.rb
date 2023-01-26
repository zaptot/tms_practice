require 'pry'

class Guesser
  LOOSE_RESULT          = 2
  WON_RESULT            = 0
  SECRET_NUMBER_GREATER = 1
  SECRET_NUMBER_LOWER   = -1

  def initialize(min, max)
    @number = rand(min..max)
    @available_count_of_guesses = Math.log((max - min + 1), 2).to_i * 2
  end

  def guess(guess_number)
    return LOOSE_RESULT if available_count_of_guesses < 1

    @available_count_of_guesses -= 1
    if guess_number == number
      WON_RESULT
    elsif guess_number < number
      SECRET_NUMBER_GREATER
    elsif guess_number > number
      SECRET_NUMBER_LOWER
    end
  end

  private

  attr_reader :number, :available_count_of_guesses
end

class Solver
  def initialize(min, max, guesser)
    @min = min
    @max = max
    @guesser = guesser
  end

  def solve
    tries_count = 0
    min, max = @min, @max

    loop do
      mid = (min + max) / 2
      current_result = guesser.guess(mid)
      tries_count += 1

      if current_result == 2
        return -1
      elsif current_result == 0
        return tries_count
      elsif current_result == 1
        min = mid + 1
      elsif current_result == -1
        max = mid - 1
      end
    end
  end

  private

  attr_reader :guesser
end

MIN = 0
MAX = 1_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000 ** 1000
guesser = Guesser.new(MIN, MAX)
solver = Solver.new(MIN, MAX, guesser)

puts solver.solve

