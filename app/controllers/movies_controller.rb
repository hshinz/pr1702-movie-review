class MoviesController < ApplicationController
  def index
    @movies = Movie.paginate page: params[:page], per_page: Settings.movies.page
  end

  def show
    @review = Review.new
    @movie = Movie.find_by id: params[:id]
    @movie_reviews = @movie.reviews.order(created_at: :DESC)
    redirect_to movies_path unless @movie
  end
end
