class ChurchesController < ApplicationController

  def index
    #search method is undefined. 
    # @search = Church.search do 
    #   fulltext params[:search]
    # end
    if params[:near]
      @churches = Church.near(params[:near])
    else
      @churches = Church.all
    end
    @hash = Gmaps4rails.build_markers(@churches) do |church, marker|
      marker.lat church.latitude
      marker.lng church.longitude
    end
     # @churches = Church.paginate(page: params[:page], per_page: 10)
    
  end

  def new
  	@church = Church.new
  end

  def create
	 @church = Church.new(church_params)
   if @church.save   
     flash[:notice] = "Church was saved successfully."
     redirect_to @church
   else
     flash[:error] = "Error creating church. Please try again."
     render :new
   end
  end	

  def show
    @church = Church.find(params[:id])
    @post = Post.new

    @hash = Gmaps4rails.build_markers(@church) do |church, marker|
      marker.lat church.latitude
      marker.lng church.longitude
    end
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

  def destroy
    @church = Church.find(params[:id])
    name = @church.name
    if @church.destroy
      flash[:notice] = "\"#{name}\" was deleted successfully."
      redirect_to churches_path
    else
      flash[:error] = "There was an error deleting the church."
      render :show
    end
  end


  private

  # Strong Parameters
   def church_params
     params.require(:church).permit(:name, :city, :description, :tag_list, :denomination_list)
   end

end
