class MapsController < ApplicationController

  def index
    @maps = History.order("created_at DESC").limit(10)
    authorize @maps
  end

  def show
    @map = History.friendly.find(params[:id])
    authorize @map
  end

end
