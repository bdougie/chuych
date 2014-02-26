class PostsController < ApplicationController
	
	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def show
		@post = Post.find(params[:id])
	end

	def edit

	end

	def create
		@post = Post.new(post_params)
		@post.user = current_user
		if @post.save
			flash[:notice] = "Post was saved."
			redirect_to welcome_index_path
		else
			flash[:error] = "There was an error saving the post. Please try again."
			render :new
		end
	end

	private

	def post_params
     params.require(:post).permit(:body)
	end

end
