class MoviesController < ApplicationController
  before_action :set_movie
  before_action :load_genre, :load_release_year, only: :index

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

  private

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
