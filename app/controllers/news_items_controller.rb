class NewsItemsController < ApplicationController

  def index
    @news = NewsItem.all
    authorize @news
  end

  def show
    @ni = NewsItem.friendly.find(params[:id])
    authorize @ni
  end

end
