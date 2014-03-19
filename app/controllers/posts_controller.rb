class PostsController < ApplicationController

  def index
    # @posts = Post.all
      @posts = Post.limit(20)

  end

  def create
      
	  @church = Church.find(params[:church_id])

		@post = Post.new(post_params)
    @post.church = @church
		# @post = current_user.posts.build(params[:post])
		@post.user = current_user
		@post.save
		authorize! :create, Post, message: "You need to be a member to create a post."

		if @post.save
			flash[:notice] = "Post was saved."
			reder 
		else
			flash[:error] = "There was an error saving the post. Please try again."
			render :new
		end
	end

	
  private

  # Strong Parameters
   def church_params
     params.require(:church).permit(:name, :city, :description, :tag_list, :denomination_list)
   end


end