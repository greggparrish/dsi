class HistoriesController < ApplicationController

  def show
    @history = History.friendly.find(params[:id])
    authorize @history
  end

end
