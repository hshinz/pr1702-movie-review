class Admin::GenresController < ApplicationController
  before_action :admin_only
  before_action :find_genre, only: [:show, :edit, :update, :destroy]

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
      flash[:success] = t(".create_success")
      redirect_to admin_genres_path
    else
      flash[:danger] = t(".create_failed")
      render :new
    end
  end

  def edit
  end

  def update
    if @genre.update_attributes(params[:genre])
      redirect_to admin_genres_path, flash[:success] = t(".update_success")
    else
      redirect_to admin_genres_path, flash[:error] = t(".update_failed")
    end
  end

  def destroy
    if @genre.destroy
      flash[:success] = t(".delete_success")
    else
      flash[:error] = t(".delete_failed")
    end
  end

private
  def find_genre
    @genre = Genre.find_by id: params[:id]
    if @genre.nil?
      flash[:error] = t(".find_failed")
      redirect_to admin_genres_path
    end
  end

  def genre_params
    params.require(:genre).permit :name, :parent_id
  end
end
