module Users
  module Confirmation
    class EmailMailer < ApplicationMailer
      def confirm_mail(user, token)
        @user = user
        @token = token

        mail(to: @user.email, subject: 'Please confirm your email')
      end
    end
  end
end
