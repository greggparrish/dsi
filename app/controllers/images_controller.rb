class ImagesController < ApplicationController

  def index
    @images = Image.page(params[:page]).per(20)
    respond_to do |format|
      format.html
      format.rss { render layout: false }
    end
  end

  def show
    @image = Image.friendly.find(params[:id])
    @more = Image.all.order("RANDOM()").limit(4)
    authorize @image
    authorize @more
  end

end
