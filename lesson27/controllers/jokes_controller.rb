require_relative 'base_controller'

class JokesController < BaseController
  def random
    jokes_count = Joke.count
    random_joke = Joke.find(rand(1..jokes_count))
    [200, { 'Content-type' => 'application/json' }, [{ message: random_joke.message }.to_json]]
  end
end
