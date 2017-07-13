class GenresController < ApplicationController

  def index
    @genres = Genre.all
    authorize @genres
  end

  def show
    @genre = Genre.friendly.find(params[:id])
    authorize @genre
  end

end
