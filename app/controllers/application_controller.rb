class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
       devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name,
                                                                  :email,
                                                                  :password,
                                                                  :cnpj,
                                                                  :main_phone_number,
                                                                  :secondary_phone_number,
                                                                  :main_address,
                                                                  :secondary_address)}

       devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email,
                                                                         :password,
                                                                         :current_password,
                                                                         :main_phone_number,
                                                                         :secondary_phone_number,
                                                                         :main_address,
                                                                         :secondary_address)}
  end
end
