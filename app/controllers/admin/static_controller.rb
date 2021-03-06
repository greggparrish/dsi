class Admin::StaticController < Admin::ApplicationController
  def home
    authorize :static, :home?
    @stories = policy_scope(Story).order("created_at ASC").limit(3)
    authorize @stories
  end

  def about
    authorize :static, :about?
  end

end

