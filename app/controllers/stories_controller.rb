class StoriesController < ApplicationController

  def index
    if params[:search]
      @stories = Kaminari.paginate_array(policy_scope(Story).search(params[:search])).page(params[:page]).per(11)
    else
        @stories = Kaminari.paginate_array(policy_scope(Story).all.where(published: true).order('created_at DESC')).page(params[:page]).per(20)
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

  def new
    @story = Story.new
    authorize @story
  end

  def create
    @story = Story.new(story_params)
    authorize @story
    respond_to do |format|
      if @story.save
        format.html { redirect_to stories_path, notice: 'Story submitted.  Thank you!.' }
        format.json { render :index, status: :created, location: @story }
      else
        format.html { render :new }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def story_params
      params.require(:story).permit(:name, :email, :place, :story_text, :image, :published)
    end

end
