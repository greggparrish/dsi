class StaticController < ApplicationController
  def home
    authorize :static, :home?
    @stories = policy_scope(Story).order("created_at ASC").limit(3)
    @news = NewsItem.order("date DESC, created_at DESC").limit(3)
    @images = Image.order("RANDOM()").limit(6)
    @timeline = History.where(exclude_from_timeline: false).where.not(date: nil).order('RANDOM()').first()
    authorize @stories
    authorize @news
  end

  def about
    authorize :static, :about?
  end

  def privacy
    authorize :static, :privacy?
  end

  def terms
    authorize :static, :terms?
  end

end

