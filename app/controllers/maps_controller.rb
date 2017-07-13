class MapsController < ApplicationController

  def index
    @maps = History.all
    authorize @maps
  end

  def show
    @map = History.friendly.find(params[:id])
    authorize @map
  end

end
