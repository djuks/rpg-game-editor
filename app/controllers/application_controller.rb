class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token, only: [:update]

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :email, :password,:password_confirmation, :current_password)}
  end
end
