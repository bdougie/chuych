class ChurchController < ApplicationController
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
			render :new
		end
  end	

  def show
    @topic = Church.find(params[:id])
  end

  def edit
  end

  def new
  end
end
