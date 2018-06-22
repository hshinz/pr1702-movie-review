class ReviewsController < ApplicationController
  before_action :authenticate_user!, :load_movie

  def new
    @review = Review.new
  end

  def create
    @review = current_user.reviews.build review_params
    if @review.save
      flash[:success] = t ".success"
      redirect_to @movie
    else
      flash[:danger] = t ".try_again"
      render :new
    end
  end

  private

  def load_movie
    @movie = Movie.find_by id: params[:movie_id]
    return if @movie
    flash[:danger] = t ".not_found"
    redirect_to root_url
  end

  def review_params
    params.require(:review).permit :title, :content, :rating, :movie_id
  end
end
