class ApplicationController < ActionController::Base
    before_action :authenticate_user!

    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :username, :password, :password_confirmation])
        devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password])
        devise_parameter_sanitizer.permit(:account_update, keys: [:email, :username, :password, :password_confirmation, :current_password, :profile_picture])
    end


end
