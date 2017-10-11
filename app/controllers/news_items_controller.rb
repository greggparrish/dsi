class NewsItemsController < ApplicationController

  def index
    @news = Kaminari.paginate_array(policy_scope(NewsItem).all.order('date DESC, created_at DESC')).page(params[:page]).per(20)
  end

  def show
    @ni = NewsItem.friendly.find(params[:id])
    authorize @ni
  end

end
