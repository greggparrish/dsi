class TimelinesController < ApplicationController

  def index
    if params[:era]
      if params[:era] == '20s_50s'
        @timeline = History.includes(:image).where(exclude_from_timeline: false).where.not(date: nil).order('date ASC').where(date: '1920-01-01'..'1959-12-31')
      elsif params[:era] == '60s_80s'
        @timeline = History.includes(:image).where(exclude_from_timeline: false).where.not(date: nil).order('date ASC').where(date: '1960-01-01'..'1989-12-31')
      elsif params[:era] == '90s_present'
        @timeline = History.includes(:image).where(exclude_from_timeline: false).where.not(date: nil).order('date ASC').where("date >= ?", "1990-01-01")
      else
        @timeline = History.includes(:image).where(exclude_from_timeline: false).where.not(date: nil).order('date ASC')
      end
    else
      @timeline = History.includes(:image).where(exclude_from_timeline: false).where.not(date: nil).order('date ASC')
    end
    authorize @timeline
  end

  def show
    @timeline = History.friendly.find(params[:id])
    authorize @timeline
  end

end
