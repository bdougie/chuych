class UsersController < Devise::RegistrationsControler
	before_filter :configure_permitted_parameters, if: :devise_controller?

	def show
		@user = User.find(params[:id])
		# @posts = @user.posts.visible_to(current_user)
	end

	def index 
	end


	private
	# #parameters for users
	# def configure_permitted_parameters
	# 	devise_parameter_sanitizer.for(:sign_up) << :name
	# end

	def configure_permitted_parameters
		devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :avatar) }
	end


end

