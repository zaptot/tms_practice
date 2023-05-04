module Jwt
  class UsersController < JwtController
    def confirm
      Users::Confirmation::ConfirmMail.call(params['token'])

      redirect_to root_path
    end
  end
end
