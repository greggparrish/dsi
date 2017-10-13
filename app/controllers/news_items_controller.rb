class NewsItemsController < ApplicationController

  def index
    @news = Kaminari.paginate_array(policy_scope(NewsItem).all.order('date DESC, created_at DESC')).page(params[:page]).per(19)
  end

  def show
    @ni = NewsItem.friendly.find(params[:id])
    @recent = NewsItem.all.order('date DESC, created_at DESC').limit(4)
    authorize @ni
    authorize @recent
  end

end
