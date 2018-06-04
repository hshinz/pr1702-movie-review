class MoviesController < ApplicationController
  before_action :load_genre, :load_release_year, only: :index

  def index
    @movies = Movie.paginate page: params[:page], per_page: Settings.movies.page
    @movies = @movies.genre(params[:genre]) if params[:genre].present?
    @movies = @movies.release_year(params[:year]) if params[:year].present?
  end

  def show
    @movie = Movie.find_by id: params[:id]
    @movie_reviews = @movie.reviews.order(created_at: :DESC)
    @movie_comments = @movie.comments.order(created_at: :DESC)
    @review = Review.new
    @comment = Comment.new
    redirect_to movies_path unless @movie
  end

  private
  
  def load_genre
    @genres = Genre.genre.collect{ |genre| [genre.name, genre.id] }
  end

  def load_release_year
    @years = Movie.order(:release_date).load_year
  end 
end
