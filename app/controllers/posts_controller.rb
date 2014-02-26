class PostsController < ApplicationController
	
	def index
		@posts = Post.all
	end

	def new
		@posts = Post.new
	end

	def show
		@post = Post.find(params[:id])
	end

	def edit

	end

	def create
		@post = Post.new(params[:post])
		if @post.save
			flash[:notice] = "Post was saved."
			redirect_to @post
		else
			flash[:error] = "There was an error saving the post. Please try again."
			render :new
		end
	end

	private

	def configure_permitted_parameters
     params.require(:post).permit(:body)
	end

end
