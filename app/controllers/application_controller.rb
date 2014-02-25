class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected
  #devise controller params
 #  def configure_permitted_parameters
	# 	devise_parameter_sanitizer.for(:sign_up) << :name
	# end

	def configure_permitted_parameters
		devise_parameter_sanitizer.for(:user) { |u| u.permit(:name, :email, :avatar) }
	end

end
