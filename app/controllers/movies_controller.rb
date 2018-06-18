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
    reviews = @movie.reviews
    reviews.blank? ? 0 : @avg_rating = reviews.average(:rating).round(2)
    @reviews = reviews.sort_reviews
    @like = LikeReview.new
    @add_watchlist = Watchlist.new
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
