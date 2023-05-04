module Users
  module Confirmation
    class SendMail
      class << self
        def call(user_id)
          user = User.find(user_id)
          token = generate_token(user_id)

          Users::Confirmation::EmailMailer.confirm_mail(user, token).deliver_now
        end

        private

        def generate_token(user_id)
          JWT.encode({ user_id: user_id }, Users::Confirmation::Constants::JWT_TOKEN)
        end
      end
    end
  end
end
