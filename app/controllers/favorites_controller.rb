class FavoritesController < ApplicationController

	  def create
    @church = Church.find(params[:church_id])

    favorite = current_user.favorites.create(church: @church)
    if favorite.valid?
      flash[:notice] = "Followed church"
      redirect_to @church
    	
    else
      flash[:error] = "Unable to add follow. Please try again."
      redirect_to @church
    end
  end

  def destroy
  @church = Church.find(params[:church_id])

  @favorite = current_user.favorites.find(params[:id])

  if @favorite.destroy
    flash[:notice] = "Removed favorite."
      redirect_to @church

  else
    flash[:error] = "Unable to remove favorite. Please try again."
      redirect_to @church
    
  end
end

 private 

 # 	def favorite_params
 #     params.require(:church).permit(:favorti)
	# end

end
