class Admin::MoviesController < ApplicationController
  before_action :set_movie
  before_action :load_genre, :load_release_year, only: :index
  before_action :admin_only, only: [:new, :create, :edit, :update, :destroy]
  def index
    @movies = Movie.all
    filtering_params(params).each do |key, value|
      @movies = @movies.public_send(key, value) if value.present?
    end

    @movies = @movies.paginate page: params[:page], per_page: Settings.movies.page
  end

  def show
    @reviews = Review.where(movie_id: @movie.id).order(created_at: :desc)
    @reviews.blank? ? 0 : @avg_rating = @reviews.average(:rating).round(2)
    @movie_comments = @movie.comments.order(created_at: :desc)
    @comment = Comment.new
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new movie_params
    if @movie.save
      flash[:success] = "Movie created"
      redirect_to admin_movies_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @movie.update(movie_params)
      flash[:success] = 'Update movie detail successful'
      redirect_to admin_movies_path
    else
      render :edit
    end
  end

  def destroy
    @movie = Movie.find_by id: params[:id]
    @movie.destroy
    flash[:success] = "Movie deleted"
    redirect_to admin_movies_path
  end

private

  def movie_params
    params.require(:movie).permit :name, :image, :trailer, :synopsis, :release_date, :genre_id, :description_id
  end

  def set_movie
    @movie = Movie.find_by id: params[:id]
  end

  def filtering_params params
    params.permit :genre, :release_year
  end

  def load_genre
    @genres = Genre.load_data.pluck :name, :id
  end

  def load_release_year
    @release_years = Movie.order(:release_date).load_year
  end

end
