module BooksHelper
  def random_joke
    jokes_count = Joke.count
    Joke.find(rand(1..jokes_count))
  end
end
