class Admin::StoriesController < Admin::ApplicationController
  before_action :set_story, only: [:show, :edit, :update, :destroy]

  def index
    if params[:search]
      @stories = Kaminari.paginate_array(Story.search(params[:search])).page(params[:page]).per(11)
    elsif params[:pubstatus] and ['true','false'].include? params[:pubstatus]
      @stories = Kaminari.paginate_array(Story.where(published: params[:pubstatus])).page(params[:page]).per(20)
    else
      @stories = Kaminari.paginate_array(Story.all.order('published ASC, created_at DESC')).page(params[:page]).per(20)
    end
    respond_to do |format|
      format.html
      format.rss { render layout: false }
    end
  end

  def show
  end

  def new
    @story = Story.new
    authorize [:admin, @story]
  end

  def edit
  end

  def create
    @story = Story.new(story_params)
    authorize [:admin, @story]
    respond_to do |format|
      if @story.save
        format.html { redirect_to @story, notice: 'Story was successfully created.' }
        format.json { render :show, status: :created, location: @story }
      else
        format.html { render :new }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @story.update(story_params)
        format.html { redirect_to @story, notice: 'Story was successfully updated.' }
        format.json { render :show, status: :ok, location: @story }
      else
        format.html { render :edit }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @story.destroy
    respond_to do |format|
      format.html { redirect_to admin_stories_url, notice: 'Story was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_story
      @story = Story.find(params[:id])
      authorize [:admin, @story]
    end

    def story_params
      params.require(:story).permit(:name, :email, :place, :story_text, :image, :published)
    end
end
