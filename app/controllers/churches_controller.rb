class ChurchesController < ApplicationController
  def index
  	@churches = Church.all
  end

  def new
  	@church = Church.new
  end

  def create
  	@church = Church.new(params[:id])
  	if @church.save  	
  		redirect_to @church, notice: "Church was saved successfully."
  	else
  		flash[:error] = "Error creating church. Please try again."
			render :index
		end
  end	

  def show
    @topic = Church.find(params[:id])
  end

  def edit
    @church = Church.find(params[:id])
    if @post.update_attributes(params[:church])
      flash[:notice] = "Church was updated."
      redirect_to @post
    else
      flash[:error] = "There was an error saving the church. Please try again."
      render :edit
    end
  end

end
