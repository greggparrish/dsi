class Admin::GenresController < Admin::ApplicationController
  before_action :set_genre, only: [:show, :edit, :update, :destroy]

  def index
    @genres = Genre.all
    authorize [:admin, @genres]
  end

  def show
  end

  def new
    @genre = Genre.new
    authorize [:admin, @genre]
  end

  def edit
  end

  def create
    @genre = Genre.new(genre_params)
    authorize [:admin, @genre]
    respond_to do |format|
      if @genre.save
        format.html { redirect_to @genre, notice: 'Genre was successfully created.' }
        format.json { render :show, status: :created, location: @genre }
      else
        format.html { render :new }
        format.json { render json: @genre.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @genre.update(genre_params)
        format.html { redirect_to @genre, notice: 'Genre was successfully updated.' }
        format.json { render :show, status: :ok, location: @genre }
      else
        format.html { render :edit }
        format.json { render json: @genre.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @genre.destroy
    respond_to do |format|
      format.html { redirect_to admin_genres_url, notice: 'Genre was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_genre
      @genre = Genre.friendly.find(params[:id])
      authorize [:admin, @genre]
    end

    def genre_params
      params.require(:genre).permit(:playlist_id,:description,:image_id,:title)
    end
end

