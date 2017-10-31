class ImagesController < ApplicationController

  def index
    if params[:search]
      @images = Kaminari.paginate_array(Image.search(params[:search])).page(params[:page]).per(11)
    else
      @images = Kaminari.paginate_array(Image.all.order('created_at DESC')).page(params[:page]).per(20)
    end
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
