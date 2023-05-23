class JokesController < ApplicationController
  def random
    sleep 20
    render json: Jokes::Random.call.to_json
  end
end
