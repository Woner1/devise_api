module Auth
  class RegisterationsController < DeviseTokenAuth::RegistrationsController
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters

      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit({ roles: [] }, :email, :password, :password_confirmation, :name) }
      # devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:nickname])
      #devise_parameter_sanitizer.permit(:account_update, keys: [:name,:nickname])
       devise_parameter_sanitizer.permit(:account_update) { |u| u.permit({ roles: [] }, :email,:name) }
    end

  end
end