class StoriesController < ApplicationController

  def index
    if params[:search]
      @stories = Kaminari.paginate_array(policy_scope(Story).search(params[:search])).page(params[:page]).per(11)
    else
      @stories = Kaminari.paginate_array(policy_scope(Story).all.order('created_at DESC')).page(params[:page]).per(20)
    end
    respond_to do |format|
      format.html
      format.rss { render layout: false }
    end
  end

  def show
    @story = Story.find(params[:id])
    authorize @story
  end

end
