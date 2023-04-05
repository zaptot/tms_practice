module Jokes
  class Random
    def self.call(params)
      new(params).call
    end

    def initialize(params)
      @params = params
    end

    def call
      jokes_count = Joke.count
      Joke.find(rand(1..jokes_count))
    end
  end
end
