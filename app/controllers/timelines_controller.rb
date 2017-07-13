class TimelinesController < ApplicationController

  def index
    @timeline = History.all
    authorize @timeline
  end

  def show
    @timeline = History.friendly.find(params[:id])
    authorize @timeline
  end

end
