class Admin::GenresController < ApplicationController
  before_action :admin_only
  before_action :find_genre, only: [:show, :destroy]

  def index
    @genres = Genre.all
  end

  def show
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new genre_params
    if @genre.save
      flash[:success] = "Genre created"
      redirect_to admin_genres_path
    else
      flash[:danger] = "Error... Something not right"
      render :new
    end
  end

  def destroy
    if @genre.destroy
      flash[:success] = "Genre deleted"
    else
      flash[:error] = "Genre not deleted"
    end
  end

private
  def find_genre
    @genre = Genre.find_by id: params[:id]
    if @genre.nil?
      flash[:error] = "Genre not found"
      redirect_to admin_genres_path
    end
  end
  def genre_params
    params.require(:genre).permit :name, :parent_id
  end
end
