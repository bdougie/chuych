class PostsController < ApplicationController

  def index
    # @posts = Post.all
      @posts = Post.limit(20)

  end

end