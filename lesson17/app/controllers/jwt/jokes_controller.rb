module Jwt
  class JokesController < JwtController
    before_action :authenticate_user

    def random
      render json: Jokes::Random.call.to_json
    end
  end
end
