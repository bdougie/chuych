class ChurchController < ApplicationController
  def index
  	@churches = Church.all
  end

  def show
  end

  def edit
  end

  def new
  end
end
