class PostsController < ApplicationController
	
	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def edit
		@post = Post.find(params[:id])
    authorize! :edit, @post, message: "You need to own the post to edit it."
	end

	def update
    @post = Post.find(params[:id])
    authorize! :update, @post, message: "You need to own the post to edit it."
    if @post.update_attributes(params[:post])
      flash[:notice] = "Post was updated."
      redirect_to @post
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :edit
    end
	end

	def create
		@post = Post.new(post_params)
		@post.user = current_user
		@post.save
		authorize! :create, Post, message: "You need to be a member to create a post."

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
