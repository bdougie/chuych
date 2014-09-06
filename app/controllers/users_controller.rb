class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
		@posts = @user.posts
		# TODO: this should be in the model
		# @churches = churches.favorited
	end

	def index
	end

end

