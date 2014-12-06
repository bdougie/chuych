class WelcomeController < ApplicationController

  before_filter :disable_nav, only: [:index]

  def index
		@posts = Post.limit(10) # paginate(page: params[:page], per_page: 15)
    ids = Church.pluck(:id).shuffle[0..7]
		@churches = Church.where(id: ids)
  end

end
