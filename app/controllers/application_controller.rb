class ApplicationController < ActionController::Base
  include PublicActivity::StoreController
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :date_of_birth, :hometown, :occupation, :bio])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :date_of_birth, :hometown, :occupation, :bio, :avatar])
  end
end
