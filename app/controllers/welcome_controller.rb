class WelcomeController < ApplicationController
  def index
		@posts = Post.limit(10) # paginate(page: params[:page], per_page: 15)
		@churches = Church.limit(10)
  end

  
end
