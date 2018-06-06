class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_movie

  def new
    @review = Review.new
  end

  def create
    @review = Review.new review_params
    if @review.save
      flash[:success] = t ".success"
      redirect_to @movie
    else
      flash[:danger] = t ".try_again"
      render :new
    end
  end

  private

  def set_movie
    @movie = Movie.find params[:movie_id]
  end

  def review_params
    params.require(:review).permit :user_id, :movie_id, :title, :content, :rating
  end
end
