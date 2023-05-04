module Users
  module Confirmation
    class ConfirmMail
      class << self
        def call(token)
          payload = decode_token(token)
          user = User.find(payload['user_id'])

          user.confirm!
        end

        private

        def decode_token(token)
          JWT.decode(token, Users::Confirmation::Constants::JWT_TOKEN, true, algorithm: 'HS256').first
        rescue JWT::DecodeError => _e
          raise JwtController::NotAuthenticated
        end
      end
    end
  end
end
