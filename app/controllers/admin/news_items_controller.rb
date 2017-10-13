class Admin::NewsItemsController < Admin::ApplicationController
  before_action :set_ni, only: [:show, :edit, :update, :destroy]

  def index
    @news = Kaminari.paginate_array(NewsItem.all.order('created_at DESC')).page(params[:page]).per(20)
  end

  def show
  end

  def new
    @ni = NewsItem.new
    authorize [:admin, @ni]
  end

  def edit
  end

  def create
    @ni = NewsItem.new(ni_params)
    authorize [:admin, @ni]
    respond_to do |format|
      if @ni.save
        format.html { redirect_to @ni, notice: 'ni was successfully created.' }
        format.json { render :show, status: :created, location: @ni }
      else
        format.html { render :new }
        format.json { render json: @ni.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @ni.update(ni_params)
        format.html { redirect_to @ni, notice: 'ni was successfully updated.' }
        format.json { render :show, status: :ok, location: @ni }
      else
        format.html { render :edit }
        format.json { render json: @ni.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @ni.destroy
    respond_to do |format|
      format.html { redirect_to admin_news_items_url, notice: 'ni was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_ni
      @ni = NewsItem.friendly.find(params[:id])
      authorize [:admin, @ni]
    end

    def ni_params
      params.require(:news_item).permit(:date,:description,:place,:title)
    end

end
