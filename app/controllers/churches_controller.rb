class ChurchesController < ApplicationController

  def index
  
    # @search = Church.search do
    #   fulltext params[:search]
    # end
    @churches = Church.all
  
  end

  def new
  	@church = Church.new
  end

  def create
  	 @church = Church.new(church_params)
     @church.save
   if @church.save   
     flash[:notice] = "Church was saved successfully."
     redirect_to @church
   else
     flash[:error] = "Error creating church. Please try again."
     render new
   end
  end	

  def show
    @church = Church.find(params[:id])
  end

  def edit
    @church = Church.find(params[:id])
  end

  def update
    if @church.update_attributes(params[:church])
      flash[:notice] = "Church was updated."
      redirect_to @church
    else
      flash[:error] = "There was an error saving the church. Please try again."
      render :edit
    end
  end

  private

  # Strong Parameters
   def church_params
     params.require(:church).permit(:name, :city, :description)
   end

end
