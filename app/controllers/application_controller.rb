class ApplicationController < ActionController::Base
# 　devise利用
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    #   keys = name?でおけかな？
    devise_parameter_sanitizer.permit(:sign_up,keys: [:first_name, :last_name, :furigana_first_name, :furigana_last_name, :postcode, :address, :phone_number])
  end
  protect_from_forgery with: :exception
end
