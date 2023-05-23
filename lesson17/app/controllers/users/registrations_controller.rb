module Users
  class RegistrationsController < Devise::RegistrationsController
    before_action :configure_sign_up_params, only: [:create]

    def create
      super do |user|
        if user.persisted?
          Users::Confirmation::SendMailWorker.perform_async(user.id)
        end
      end
    end

    protected

    def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up, keys: [:locale, :avatar])
    end
  end
end
