class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def new
    @review = Review.new
  end

  def create
    @review = Review.new review_params
    if @review.save
      flash[:success] = t ".done"
      redirect_to movies_path
    else
      flash[:danger] = t ".try_again"
      render :new
    end
  end

  private
  def review_params
    params.require(:review).permit :user_id, :movie_id, :title, :content
  end
end
