class MapsController < ApplicationController

  def index
    @maps = History.where(exclude_from_map: false).where.not(latitude: nil).where.not(longitude: nil).limit(10)
    authorize @maps
  end

  def show
    @map = History.friendly.find(params[:id])
    authorize @map
  end

end
