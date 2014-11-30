class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
  	redirect_to root_url, :alert => exception.message
  end

  def after_sign_in_path_for(resource)
    root_path
  end

  def disable_nav
    @disable_nav = true
  end

private
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:avatar, :name, :email, :username, :password, :password_confirmation,
      :remember_me, :provider, :uid]
    devise_parameter_sanitizer.for(:account_update) << [:avatar, :name, :username, :email, :user]
  end

end
