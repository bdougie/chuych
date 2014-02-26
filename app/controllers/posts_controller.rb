class PostsController < ApplicationController
	
	def index
		@posts = Post.all
	end

	def new
		@posts = Post.new
	end

	def show
		@post =  Post.find(params[:id])
	end

	def edit

	end

	private

	def configure_permitted_parameters
     params.require(:post).permit(:body)
	end

end
