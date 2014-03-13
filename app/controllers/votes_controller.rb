class VotesController < ApplicationController
	before_filter :setup

	def up_vote
		update_vote(1)
		redirect_to :back
	end

	def down_vote
		update_vote(-1)
		redirect_to :back
	end

	private

	def setup
		@post = Post.find(vote_params[:post_id])
		authorize! :create, Post, message: "You need to be a user to do that."

		@vote = @post.posts.where(user_id: current_user.id).first
	end

	def update_post(new_value)
		if @post
			@post.update_attribute(:value, new_value)
		else
			@post = current_user.posts.create(value: new_value, post: @post)
		end
	end


	 private

  # Strong Parameters
   def vote_params
     params.require(:post).permit(:value, :post)
   end
end