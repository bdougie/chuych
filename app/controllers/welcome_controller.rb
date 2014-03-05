class WelcomeController < ApplicationController
  def index
		@posts = Post.limit(15) # paginate(page: params[:page], per_page: 15)
  end
end
