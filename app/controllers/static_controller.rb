class StaticController < ApplicationController
  def home
    authorize :static, :home?
    @stories = policy_scope(Story).order("created_at ASC").limit(3)
    @news = NewsItem.order("created_at ASC").limit(3)
    @images = Image.order("created_at ASC").limit(4)
    authorize @stories
    authorize @news
  end

  def about
    authorize :static, :about?
  end

end

