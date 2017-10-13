class GenresController < ApplicationController

  def index
      @genres = Genre.all.order('title ASC')
    authorize @genres
  end

  def show
    @genre = Genre.friendly.find(params[:id])
    authorize @genre
  end

end
