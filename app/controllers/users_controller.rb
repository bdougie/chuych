class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
		# @posts = @user.posts.visible_to(current_user)
	end

	def index 
	end


	private
	#parameters for users
	#def users_params
		#params.require(:user).permit(:avatar)
	#end

end

