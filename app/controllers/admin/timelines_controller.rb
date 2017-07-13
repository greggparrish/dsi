class Admin::StoriesController < ApplicationController
  before_action :set_timeline, only: [:show, :edit, :update, :destroy]

  def index
    @timelines = History.all 
  end

  def show
  end

  def new
    @timeline = History.new
    authorize [:admin, @timeline]
  end

  def edit
  end

  def create
    @timeline = History.new(timeline_params)
    authorize [:admin, @timeline]
    respond_to do |format|
      if @timeline.save
        format.html { redirect_to @timeline, notice: 'timeline was successfully created.' }
        format.json { render :show, status: :created, location: @timeline }
      else
        format.html { render :new }
        format.json { render json: @timeline.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @timeline.update(timeline_params)
        format.html { redirect_to @timeline, notice: 'timeline was successfully updated.' }
        format.json { render :show, status: :ok, location: @timeline }
      else
        format.html { render :edit }
        format.json { render json: @timeline.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @timeline.destroy
    respond_to do |format|
      format.html { redirect_to stories_url, notice: 'timeline was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_timeline
      @timeline = History.find(params[:id])
      authorize [:admin, @timeline]
    end

    def timeline_params
      params.require(:timeline).permit(:image, :title, :date, :description, :media)
    end
end
