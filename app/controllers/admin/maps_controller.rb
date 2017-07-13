class Admin::StoriesController < ApplicationController
  before_action :set_map, only: [:show, :edit, :update, :destroy]

  def index
    @maps = History.all 
  end

  def show
  end

  def new
    @map = History.new
    authorize [:admin, @map]
  end

  def edit
  end

  def create
    @map = History.new(map_params)
    authorize [:admin, @map]
    respond_to do |format|
      if @map.save
        format.html { redirect_to @map, notice: 'map was successfully created.' }
        format.json { render :show, status: :created, location: @map }
      else
        format.html { render :new }
        format.json { render json: @map.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @map.update(map_params)
        format.html { redirect_to @map, notice: 'map was successfully updated.' }
        format.json { render :show, status: :ok, location: @map }
      else
        format.html { render :edit }
        format.json { render json: @map.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @map.destroy
    respond_to do |format|
      format.html { redirect_to stories_url, notice: 'map was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_map
      @map = History.find(params[:id])
      authorize [:admin, @map]
    end

    def map_params
      params.require(:map).permit(:image, :title, :date, :description, :media)
    end
end
