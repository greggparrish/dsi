class GenresController < ApplicationController

  def index
    @genres = Genre.includes(:image).all.order('title ASC')
    authorize @genres
  end

  def show
    @genre = Genre.includes(:image).friendly.find(params[:id])
    authorize @genre
  end

end
