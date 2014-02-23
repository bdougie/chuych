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
  		flash[:notice] = "Church was saved successfully."
      redirect_to @church
  	else
  		flash[:error] = "Error creating church. Please try again."
			render new
		end
  end	

  def show
    @topic = Church.find(params[:id])
  end

  def edit
    @church = Church.find(params[:id])
    if @church.update_attributes(params[:church])
      flash[:notice] = "Church was updated."
      redirect_to churches_path
    else
      flash[:error] = "There was an error saving the church. Please try again."
      render :edit
    end
  end

  private

  @church = Church.create(church_params)

end
