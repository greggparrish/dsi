class HistoriesController < ApplicationController

  def show
    @history = History.friendly.find(params[:id])
    @nearby = History.where(exclude_from_map: false).where.not(latitude: nil).where.not(longitude: nil).where.not(id: @history.id).near([@history.latitude, @history.longitude], 5).limit(4)
    @same_time = History.where(exclude_from_timeline: false).where.not(date: nil).where.not(id: @history.id).order('date ASC').where("date >= ? AND date <= ?", @history.date - 90.days, @history.date + 90.days).order(:date).limit(10)
    authorize @history
    authorize @nearby
    authorize @same_time
  end

end
