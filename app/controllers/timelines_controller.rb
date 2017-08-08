class TimelinesController < ApplicationController

  def index
    @timeline = History.where(exclude_from_timeline: false).where.not(date: nil)
    authorize @timeline
  end

  def show
    @timeline = History.friendly.find(params[:id])
    authorize @timeline
  end

end
