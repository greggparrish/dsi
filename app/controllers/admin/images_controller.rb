class Admin::ImagesController < Admin::ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]

  def index
    if params[:search]
      @images = Kaminari.paginate_array(Image.search(params[:search])).page(params[:page]).per(11)
    else
      @images = Kaminari.paginate_array(Image.all.order('created_at DESC')).page(params[:page]).per(20)
    end
    respond_to do |format|
      format.html
      format.rss { render layout: false }
    end
  end

  def show
  end

  def new
    @image = Image.new
    authorize [:admin, @image]
  end

  def edit
  end

  def create
    @image = Image.new(image_params)
    authorize [:admin, @image]
    respond_to do |format|
      if @image.save
        format.html { redirect_to @image, notice: 'Image was successfully created.' }
        format.json { render :show, status: :created, location: @image }
      else
        format.html { render :new }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @image.update(image_params)
        format.html { redirect_to @image, notice: 'Image was successfully updated.' }
        format.json { render :show, status: :ok, location: @image }
      else
        format.html { render :edit }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @image.destroy
    respond_to do |format|
      format.html { redirect_to images_url, notice: 'Image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_image
      @image = Image.friendly.find(params[:id])
      authorize [:admin, @image]
    end

    def image_params
      params.require(:image).permit(:audio,:description,:image,:title)
    end
end

