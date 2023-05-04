module Jokes
  class Random
    def self.call
      Joke.order('random()').first
    end
  end
end
