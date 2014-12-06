class FavoritesController < ApplicationController

  def create
    @church = Church.find(params[:church_id])
    favorite = current_user.favorites.create(church: @church)
    if favorite.valid?
      flash[:notice] = "Connected to #{@church.name}"
      redirect_to @church
    else
      flash[:error] = "Unable to connect. Please try again."
      redirect_to @church
    end
  end

  def destroy
    @church = Church.find(params[:church_id])
    @favorite = current_user.favorites.find(params[:id])
    if @favorite.destroy
      flash[:notice] = "Removed your connection from #{@church.name}."
        redirect_to @church
    else
      flash[:error] = "Unable to remove connection from #{@church.name}. Please try again."
        redirect_to @church
    end
  end

end
