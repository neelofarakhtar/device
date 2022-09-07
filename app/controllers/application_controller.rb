class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :print_display_message

  after_action :after_display_message

  private
  def print_display_message
    puts "I am an inherited before action filter"
  end

  def after_display_message
    puts "=============================="
    puts "I am after action filter"
    puts "=============================="
  end

  protected

  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: [:login, :password]
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
